import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techara_merchant/src/core/const/variable.dart';
import 'package:techara_merchant/src/core/enums/general.dart';
import 'package:techara_merchant/src/core/extenstion/general.dart';
import 'package:techara_merchant/src/core/snackbar/snackbar.dart';
import 'package:techara_merchant/src/main/auth/presentation/cubit/bloc/otp_bloc.dart';
import 'package:techara_merchant/src/main/auth/presentation/widget/otp_button.dart';
import 'package:techara_merchant/src/main/main_page.dart';

class ModernOTPScreen extends StatefulWidget {
  final String? classnumber;
  final bool? whatsapp;
  final String idetifyer;

  const ModernOTPScreen({
    super.key,
    this.classnumber,
    this.whatsapp,
    required this.idetifyer,
  });

  @override
  State<ModernOTPScreen> createState() => _ModernOTPScreenState();
}

class _ModernOTPScreenState extends State<ModernOTPScreen>
    with TickerProviderStateMixin {
  final List<TextEditingController> _controllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  late AnimationController _slideController;
  late AnimationController _fadeController;
  late AnimationController _pulseController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _pulseAnimation;

  Timer? _timer;

  bool _isResendEnabled = false;

  late OtpCubit _otpBloc;

  @override
  void initState() {
    super.initState();
    _otpBloc = context.read<OtpCubit>();

    _setupAnimations();
    _startTimer();

    // Auto-focus first field
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNodes[0].requestFocus();
    });
  }

  void _setupAnimations() {
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(parent: _slideController, curve: Curves.easeOutCubic),
        );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _fadeController, curve: Curves.easeOut));

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.elasticOut),
    );

    _slideController.forward();
    _fadeController.forward();
  }

  void _startTimer() {
    _timer?.cancel();
    _otpBloc.setTimer();
    setState(() {
      _isResendEnabled = false;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_otpBloc.state.remainingTime > 0) {
          _otpBloc.decreaseRemainingTime();
        } else {
          _isResendEnabled = true;
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _slideController.dispose();
    _fadeController.dispose();
    _pulseController.dispose();
    _timer?.cancel();
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  String get _otpCode {
    return _controllers.map((controller) => controller.text).join();
  }

  void _onOTPChanged(int index, String value) {
    if (value.isNotEmpty && index < 5) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }

    // Check if OTP is complete
    if (_otpCode.length == 6) {
      _verifyOTP();
    }
  }

  void _verifyOTP() async {
    if (_otpCode.length < 6) {
      showWarningSnackBar('يرجى إدخال الرمز بالكامل');
      return;
    }
    _pulseController.forward();
    _otpBloc.verifyOtp(classNumber: widget.classnumber!, otpCode: _otpCode);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: BlocListener<OtpCubit, OtpState>(
        listenWhen: (previous, current) => current.state != previous.state,
        listener: (context, state) {
          if (state.state == RemoteDataState.loaded) {
            // _pulseController.forward();
            _timer?.cancel();
            Future.delayed(const Duration(seconds: 2), () {
              navigatorKey.currentState?.pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const MainPage()),
                (route) => false,
              );
            });
          }
          if (state.state == RemoteDataState.subSuccess) {
            if (!_isResendEnabled) return;

            _startTimer();

            // Clear OTP fields
            for (var controller in _controllers) {
              controller.clear();
            }
            _focusNodes[0].requestFocus();
          }
          if (state.state == RemoteDataState.error) {
            showErrorSnackBar(
              state.errorMessage == 'resend'
                  ? 'حدث خطأ أثناء إعادة إرسال الرمز. يرجى المحاولة مرة أخرى.'
                  : 'الرمز غير صحيح. يرجى التحقق من الرمز وإعادة المحاولة.',
            );
          }
        },
        child: BlocBuilder<OtpCubit, OtpState>(
          builder: (context, otpState) {
            return SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  child: ListView(
                    children: [
                      // Header Icon
                      Center(
                        child: Container(
                          width: 70,
                          height: 70,

                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: otpState.state == RemoteDataState.loaded
                                  ? [Colors.green, Colors.green.shade600]
                                  : [
                                      theme.colorScheme.primary,
                                      theme.colorScheme.primary.withAlpha(200),
                                    ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    (otpState.state == RemoteDataState.loaded
                                            ? Colors.green
                                            : Colors.blue)
                                        .withOpacity(0.3),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Icon(
                            otpState.state == RemoteDataState.loaded
                                ? Icons.check_rounded
                                : Icons.message_rounded,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        child: Column(
                          children: [
                            // Title
                            Text(
                              otpState.state == RemoteDataState.loaded
                                  ? 'تم التحقق بنجاح!'
                                  : 'التحقق من الرمز',
                              style: theme.textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: otpState.state == RemoteDataState.loaded
                                    ? Colors.green
                                    : Colors.black87,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10),
                            // Subtitle
                            Text(
                              otpState.state == RemoteDataState.loaded
                                  ? 'تم التحقق من هويتك بنجاح'
                                  : 'أدخل الرمز المرسل إلى ${maskContact(widget.idetifyer ?? "")}',
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: Colors.grey[600],
                                height: 1.5,
                              ),
                              textAlign: TextAlign.center,
                            ),

                            const SizedBox(height: 20),

                            // OTP Input Fields
                            if (otpState.state != RemoteDataState.loaded) ...[
                              // Container(
                              //   width: double.infinity,
                              //   padding: const EdgeInsets.all(16),
                              //   decoration: BoxDecoration(
                              //     color: Colors.white,
                              //     borderRadius: BorderRadius.circular(20),
                              //     boxShadow: [
                              //       BoxShadow(
                              //         color: Colors.black.withAlpha(100),
                              //         blurRadius: 20,
                              //         offset: const Offset(0, 5),
                              //       ),
                              //     ],
                              //   ),
                              //   child:
                              Column(
                                children: [
                                  // OTP Fields
                                  Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: List.generate(6, (index) {
                                        return _buildOTPField(index);
                                      }),
                                    ),
                                  ),

                                  const SizedBox(height: 10),

                                  // Timer and Resend
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.access_time,
                                        size: 18,
                                        color: _isResendEnabled
                                            ? Colors.orange
                                            : Colors.blue,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        _isResendEnabled
                                            ? 'يمكنك إعادة الإرسال الآن'
                                            : 'إعادة الإرسال خلال ${_otpBloc.state.remainingTime} ثانية',
                                        style: TextStyle(
                                          color: _isResendEnabled
                                              ? Colors.orange
                                              : Colors.grey[600],
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),

                                  // Resend Button
                                  TextButton(
                                    onPressed: _isResendEnabled
                                        ? () => _otpBloc.resentOtp(
                                            classNumber: widget.classnumber!,
                                            whatsapp: widget.whatsapp ?? false,
                                          )
                                        : null,
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.blue,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 30,
                                        vertical: 15,
                                      ),
                                    ),
                                    child: Text(
                                      'إعادة إرسال الرمز',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: _isResendEnabled
                                            ? Colors.blue
                                            : Colors.grey[400],
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 30),
                            ],
                          ],
                        ),
                      ), // Success Message

                      if (otpState.state == RemoteDataState.loaded) ...[
                        Container(
                          padding: const EdgeInsets.all(20),
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.green.shade50,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.green.shade200),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: Colors.green,
                                size: 24,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  'تم التحقق من رمز الأمان بنجاح، سيتم توجيهك للصفحة الرئيسية',
                                  style: TextStyle(
                                    color: Colors.green.shade700,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      OtpButton(
                        onPressed: () {
                          _verifyOTP();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildOTPField(int index) {
    return Container(
      width: 45,
      height: 55,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: TextFormField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        decoration: const InputDecoration(
          counterText: '',
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
        ),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onChanged: (value) => _onOTPChanged(index, value),
      ),
    );
  }
}
