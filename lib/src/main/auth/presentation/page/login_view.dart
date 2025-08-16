import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:techara_merchant/src/core/const/variable.dart';
import 'package:techara_merchant/src/core/enums/general.dart';
import 'package:techara_merchant/src/core/snackbar/snackbar.dart';
import 'package:techara_merchant/src/core/widgets/custom_drop_down.dart';
import 'package:techara_merchant/src/core/widgets/custom_text_field.dart';
import 'package:techara_merchant/src/core/widgets/logo_animation.dart';
import 'package:techara_merchant/src/main/auth/presentation/cubit/login/login_cubit.dart';
import 'package:techara_merchant/src/main/auth/presentation/cubit/otp_login/otp_bloc.dart';
import 'package:techara_merchant/src/main/auth/presentation/page/otp_view.dart';
import 'package:techara_merchant/src/main/auth/presentation/page/singup/signup_page.dart';
import 'package:techara_merchant/src/main/auth/presentation/widget/login_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _azubaraNumberController =
      TextEditingController();
  final TextEditingController _letterController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late LoginCubit _loginCubit;

  // Radio button selection
  String _selectedOtpType = '';

  @override
  void initState() {
    super.initState();
    // _classNumberController.text = ع31076;
    // _passwordController.text = '@vytHNTphbqZ';
    _loginCubit = context.read<LoginCubit>();
  }

  @override
  void dispose() {
    _azubaraNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.state == RemoteDataState.error) {
          // Handle error
          showErrorSnackBar(state.errorMessage ?? 'حدث خطأ أثناء تسجيل الدخول');
        } else if (state.state == RemoteDataState.subSuccess) {
          openSheet(
            context,
            BlocProvider(
              create: (_) => OtpCubit(),
              child: ModernOTPScreen(
                whatsapp: _selectedOtpType == 'whatsapp',
                classnumber:
                    _letterController.text +
                    _azubaraNumberController.text.trim(),
                idetifyer: state.idetifyer ?? '',
              ),
            ),
          );
        }
      },
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Container(
            height: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  colorScheme.primary,
                  const Color.fromARGB(255, 12, 179, 165),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SafeArea(child: const LogoAnimation()),

                  // Title
                  Text(
                    'تسجيل الدخول',
                    style: textTheme.headlineLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 24),
                  Container(
                    margin: EdgeInsets.all(12),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 24,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),

                    child: _buildLogin(textTheme, colorScheme),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogin(TextTheme textTheme, ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: CustomDropDownField(
                  label: 'الحرف',
                  controller: _letterController,
                  items: arabicLetterArray,
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: CustomTextForm(
                  controller: _azubaraNumberController,
                  keyboardType: TextInputType.number,
                  hintText: 'رقم',
                  title: 'رقم',
                  onEdit: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return;
                    }
                    _azubaraNumberController.text = filtterTextToNumber(p0);
                    return null;
                  },
                  onValidate: (p0) =>
                      p0?.isEmpty == true ? 'يرجى إدخال رقم' : null,
                ),
              ),
            ],
          ),

          // Text(
          //   'رقم الصنف',
          //   style: textTheme.titleMedium?.copyWith(
          //     fontWeight: FontWeight.w600,
          //     color: colorScheme.onSurface,
          //   ),
          // ),
          // const SizedBox(height: 8),
          // CustomTextForm(
          //   controller: _classNumberController,
          //   hintText: 'أدخل رقم الصنف',
          //   onValidate: (value) {
          //     if (value == null || value.isEmpty) {
          //       return 'يرجى إدخال رقم الصنف';
          //     }
          //     return null;
          //   },
          //   suffixWidget: Padding(
          //     padding: const EdgeInsets.only(right: 16),
          //     child: Icon(
          //       PhosphorIcons.cube(),
          //       size: 22,
          //       color: colorScheme.primary,
          //     ),
          //   ),
          // ),
          const SizedBox(height: 12),

          // Password Field
          Text(
            'كلمة المرور',
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 8),
          CustomTextForm(
            controller: _passwordController,
            isPasswordVisible: true,
            hintText: 'أدخل كلمة المرور',

            onValidate: (value) {
              if (value == null || value.isEmpty) {
                return 'يرجى إدخال كلمة المرور';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),

          // Form Card
          _buildRadioButton(textTheme, colorScheme),

          // const SizedBox(height:12),
          LoginButton(onPressed: _handleLogin),
          TextButton(
            onPressed: () => navigatorKey.currentState!.push(
              MaterialPageRoute(builder: (_) => const SignUpPage()),
            ),
            child: Text('إنشاء حساب جديد', textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }

  Widget _buildRadioButton(TextTheme textTheme, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Item Number Field
        Text('اختر طريقة ارسال رمز التحقق', style: textTheme.titleSmall),
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

  void _handleLogin() {
    if (_loginCubit.state.idetifyer == RemoteDataState.loading) {
      return; // Prevent multiple submissions
    }
    if (!_formKey.currentState!.validate()) {
      // showWarningSnackBar('يرجى ملء جميع الحقول المطلوبة');
      return;
    }

    if (_selectedOtpType.isEmpty) {
      showWarningSnackBar('يرجى اختيار طريقة ارسال رمز التحقق');
      return;
    }

    _loginCubit.login(
      classNumber:
          _letterController.text.trim() + _azubaraNumberController.text.trim(),
      password: _passwordController.text.trim(),
      whatsapp: _selectedOtpType == 'whatsapp',
    );
  }
}

void openSheet(BuildContext context, Widget child) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // important for keyboard resize
    useSafeArea: true,
    backgroundColor: Colors.transparent,
    enableDrag: false,

    isDismissible: false,
    builder: (_) {
      return LayoutBuilder(
        builder: (context, constraints) {
          final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
          // If keyboard is visible, start bigger
          final initialSize = keyboardHeight > 0 ? 0.95 : 0.6;

          return DraggableScrollableSheet(
            expand: false,
            initialChildSize: initialSize,
            minChildSize: 0.2,
            maxChildSize: 0.95,
            snap: true,
            snapSizes: const [0.6, 0.95],

            builder: (context, scrollController) {
              return Padding(
                // push content above keyboard
                padding: EdgeInsets.only(bottom: keyboardHeight),
                child: child,
              );
            },
          );
        },
      );
    },
  );
}

filtterTextToNumber(String text) {
  RegExp regex = new RegExp(r'\d+');
  String numbers = regex
      .allMatches(text)
      .map((m) => m.group(0)!)
      .toList()
      .join('');

  return numbers;
}

// The `numbers` list will contain ['2', '15']
