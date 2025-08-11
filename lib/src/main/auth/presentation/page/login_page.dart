// The login screen with sign-in buttons
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:techara_merchant/src/main/auth/presentation/cubit/login/login_cubit.dart';
import 'package:techara_merchant/src/main/auth/presentation/page/login_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [BlocProvider(create: (_) => LoginCubit())],
      child: const LoginView(),
    );
  }
}
