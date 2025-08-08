import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techara_merchant/src/main/profile/presentation/cubit/resetpassword/reset_password_cubit.dart';
import 'package:techara_merchant/src/main/profile/presentation/pages/reset_password.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(),
      child: const ResetPasswordView(),
    );
  }
}
