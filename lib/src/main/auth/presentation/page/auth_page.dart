// The login screen with sign-in buttons
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:techara_merchant/src/main/auth/presentation/cubit/cubit/login_cubit.dart';
import 'package:techara_merchant/src/main/auth/presentation/page/auth_view.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (_) => LoginCubit()),
        // BlocProvider(create: (_) => AppleLoginCubit()),
      ],
      child: const SignUpPage(),
    );
  }
}
