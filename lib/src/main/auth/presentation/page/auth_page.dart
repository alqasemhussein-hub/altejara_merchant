// The login screen with sign-in buttons
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techara_merchant/src/main/auth/presentation/page/auth_view.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // BlocProvider(create: (_) => LoginGoogleCubit()),
        // BlocProvider(create: (_) => AppleLoginCubit()),
      ],
      child: const AuthView(),
    );
  }
}
