import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:techara_merchant/api/export.dart';
import 'package:techara_merchant/src/core/const/variable.dart';
import 'package:techara_merchant/src/core/enums/general.dart';
import 'package:techara_merchant/src/core/extenstion/validation.dart';
import 'package:techara_merchant/src/core/snackbar/snackbar.dart';
import 'package:techara_merchant/src/core/widgets/custom_drop_down.dart';
import 'package:techara_merchant/src/core/widgets/custom_text_field.dart';
import 'package:techara_merchant/src/main/auth/presentation/cubit/forget_password/forget_password_cubit.dart';
import 'package:techara_merchant/src/main/auth/presentation/cubit/otp_login/otp_bloc.dart';
import 'package:techara_merchant/src/main/auth/presentation/page/forget_password/change_password.dart';
import 'package:techara_merchant/src/main/auth/presentation/page/login_view.dart';
import 'package:techara_merchant/src/main/auth/presentation/page/singup/sign_up_otp_view.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  _ForgetPasswordViewState createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final classNumberController = TextEditingController();
  final letterController = TextEditingController();
  String _selectedOtpType = '';
  final otpControllers = List.generate(6, (index) => TextEditingController());
  late OtpCubit _otpCubit;
  late ForgetPasswordCubit _forgetPasswordCubit;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _otpCubit = context.read<OtpCubit>();
    _forgetPasswordCubit = context.read<ForgetPasswordCubit>();
  }

  @override
  void dispose() {
    classNumberController.dispose();
    letterController.dispose();

    otpControllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  void _sendOrder() {
    _otpCubit.sendForgetPasswordOtp(
      ForgetPasswordQuery(
        azbaraNumber: letterController.text + classNumberController.text,
        isWhatsApp: _selectedOtpType == 'whatsapp',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return BlocConsumer<OtpCubit, OtpState>(
      listenWhen: (previous, current) => previous.state != current.state,
      listener: (context, state) {
        // if (state.state == RemoteDataState.error) {
        //   handleError(state.errorMessage);
        // }
        if (state.state == RemoteDataState.subSuccess) {
          openSheet(
            context,
            BlocProvider.value(
              value: context.read<OtpCubit>(),
              child: GeneralOtpVerfityView(
                title: 'تأكيد الرمز',
                email: state.idetifyer ?? '',
                onVerifySuccess: () {},
                onVerify: (otp) => _otpCubit.verifyForgetOtp(
                  classNumber:
                      letterController.text + classNumberController.text,
                  otpCode: otp,
                ),
                onResend: () {
                  Navigator.pop(context);
                  _sendOrder();
                },
              ),
            ),
          );
        }
        if (state.state == RemoteDataState.loaded) {
          Navigator.pop(context);
          openSheet(
            context,
            BlocProvider.value(
              value: _forgetPasswordCubit,
              child: ChangePasswordView(),
            ),
            0.8,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 90,
            title: Text('نسيت كلمة المرور'),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/logo.png'),
              ),
            ],
          ),
          body: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: ListView(
                children: [
                  Text(
                    'قم بإدخال رقم الصنف',
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'ادخل رقم الصنف الموجود في هوية غرفة تجارة بغداد',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  // Classification input
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: CustomDropDownField(
                          label: 'الحرف',
                          controller: letterController,
                          items: arabicLetterArray,
                          onChanged: (value) {
                            setState(() {
                              //  selectedClassification = value ?? '';
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        flex: 2,
                        child: CustomTextForm(
                          controller: classNumberController,
                          keyboardType: TextInputType.number,
                          hintText: 'رقم',
                          title: 'رقم',
                          onValidate: (p0) =>
                              p0?.isEmpty == true ? 'يرجى إدخال رقم' : null,
                          onEdit: (p0) {
                            if (p0 == null || p0.isEmpty) {
                              return;
                            }
                            classNumberController.text = filtterTextToNumber(
                              p0,
                            );
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  // Next button
                  _buildRadioButton(textTheme, colorScheme),
                  BlocBuilder<OtpCubit, OtpState>(
                    builder: (context, state) {
                      return SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: state.state == RemoteDataState.loading
                              ? null
                              : () {
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    if (_selectedOtpType.isEmpty) {
                                      showWarningSnackBar(
                                        'يرجى اختيار طريقة الاسترجاع',
                                      );
                                    } else {
                                      _sendOrder();
                                    }
                                  }
                                },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: state.state == RemoteDataState.loading
                              ? CircularProgressIndicator()
                              : Text(
                                  'التالي',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildRadioButton(TextTheme textTheme, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Item Number Field
        Text('اختر طريقة الاسترجاع', style: textTheme.titleSmall),
        const SizedBox(height: 12),

        // Radio Button Options
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: _selectedOtpType.isEmpty
                  ? colorScheme.error.withOpacity(0.5)
                  : colorScheme.outline.withOpacity(0.3),
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              // Individual Merchant Option
              RadioListTile<String>(
                title: Row(
                  children: [
                    Icon(
                      PhosphorIcons.whatsappLogo(),
                      size: 25,
                      color: Colors.green,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      ' واتساب',
                      style: textTheme.bodyLarge?.copyWith(
                        fontWeight: _selectedOtpType == 'whatsapp'
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),

                value: 'whatsapp',
                groupValue: _selectedOtpType,
                activeColor: colorScheme.primary,
                onChanged: (String? value) {
                  setState(() {
                    _selectedOtpType = value ?? '';
                  });
                },
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
              ),

              Divider(height: 1, color: colorScheme.outline.withOpacity(0.2)),

              // Corporate Merchant Option
              RadioListTile<String>(
                title: Row(
                  children: [
                    Icon(
                      PhosphorIcons.envelope(),
                      size: 25,
                      color: colorScheme.primary,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'البريد الإلكتروني',
                      style: textTheme.bodyLarge?.copyWith(
                        fontWeight: _selectedOtpType == 'email'
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),

                value: 'email',
                groupValue: _selectedOtpType,
                activeColor: colorScheme.primary,
                onChanged: (String? value) {
                  setState(() {
                    _selectedOtpType = value ?? '';
                  });
                },
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // Login Button
      ],
    );
  }

  void handleError(String? errorMessage) {
    showErrorSnackBar(errorMessage ?? 'رقم الاضبارة غير موجود');
  }
}
