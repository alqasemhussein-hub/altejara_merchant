import 'package:flutter/material.dart';
import 'package:techara_merchant/src/main/auth/presentation/page/login_view.dart';
import 'package:techara_merchant/src/main/auth/presentation/page/singup/sign_up_view.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: isLogin
          ? LoginView(
              onSignUpChange: () {
                setState(() {
                  isLogin = false;
                });
              },
            )
          : SignUpView(
              onLoginChange: () {
                setState(() {
                  isLogin = true;
                });
              },
            ),
    );
  }
}
