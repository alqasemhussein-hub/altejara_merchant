import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:techara_merchant/src/core/widgets/custom_text_field.dart';
import 'package:techara_merchant/src/core/widgets/logo_animation.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController.text = "و3386";
    _passwordController.text = "jNh&8PvWv43j";
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          height: double.infinity,
          alignment: Alignment.center,

          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                colorScheme.primary,
                Color.fromARGB(255, 12, 179, 165), // Light greenish color),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  LogoAnimation(),

                  // Title
                  Text('تسجيل الدخول', style: textTheme.headlineLarge),

                  const SizedBox(height: 52),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('رقم الصنف', style: textTheme.labelLarge),
                      const SizedBox(height: 8),
                      CustomTextForm(
                        controller: _emailController,
                        hintText: 'أدخل رقم الصنف',
                        onValidate: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يرجى إدخال رقم الصنف';
                          }
                          return null;
                        },
                        suffixWidget: Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Icon(PhosphorIcons.cube(), size: 22),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Password field
                      Text('كلمة المرور', style: textTheme.labelLarge),
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

                      const SizedBox(height: 20),

                      // Terms checkbox

                      // Login button
                      SizedBox(
                        width: double.infinity,
                        height: 58,
                        child: ElevatedButton(
                          onPressed: _handleLogin,

                          child: const Text('تسجيل الدخول'),
                        ),
                      ),

                      // Divider

                      // Sign up link
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleLogin() {
    if (!_formKey.currentState!.validate()) {
      _showSnackBar('Please fill in all fields');
      return;
    }

    _showSnackBar('Sign up successful!');
    // Add your login logic here
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}

//
