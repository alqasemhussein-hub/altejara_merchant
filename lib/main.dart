import 'package:flutter/material.dart';
import 'presentation/login_page.dart';
import 'application/use_cases/login_use_case.dart';
import 'application/use_cases/send_otp_use_case.dart';
import 'application/use_cases/verify_otp_use_case.dart';
import 'infrastructure/repositories/fake_auth_repository.dart';

void main() {
  final repository = FakeAuthRepository();
  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  final FakeAuthRepository repository;
  const MyApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Demo',
      home: LoginPage(
        loginUseCase: LoginUseCase(repository),
        sendOtpUseCase: SendOtpUseCase(repository),
        verifyOtpUseCase: VerifyOtpUseCase(repository),
      ),
    );
  }
}
