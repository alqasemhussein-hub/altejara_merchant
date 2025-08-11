// The login screen with sign-in buttons
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:techara_merchant/src/main/auth/presentation/cubit/otp_login/otp_bloc.dart';
import 'package:techara_merchant/src/main/auth/presentation/cubit/register/register_cubit.dart';
import 'package:techara_merchant/src/main/auth/presentation/page/singup/sign_up_view.dart';
import 'package:techara_merchant/src/main/certificate/presentation/cubit/upload_file/upload_file_cubit.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (_) => RegisterCubit()),
        BlocProvider(create: (_) => UploadFileCubit()),
        BlocProvider(create: (_) => OtpCubit()),
      ],
      child: const SignUpView(),
    );
  }
}
