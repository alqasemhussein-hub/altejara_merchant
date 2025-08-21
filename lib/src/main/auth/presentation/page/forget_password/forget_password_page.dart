// The login screen with sign-in buttons
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:techara_merchant/src/main/auth/presentation/cubit/forget_password/forget_password_cubit.dart';
import 'package:techara_merchant/src/main/auth/presentation/cubit/otp_login/otp_bloc.dart';
import 'package:techara_merchant/src/main/auth/presentation/page/forget_password/forget_password_view.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (_) => ForgetPasswordCubit()),

        BlocProvider(create: (_) => OtpCubit()),
      ],
      child: const ForgetPasswordView(),
    );
  }
}
