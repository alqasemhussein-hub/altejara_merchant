import 'package:flutter/material.dart';
import '../application/use_cases/send_otp_use_case.dart';
import '../application/use_cases/verify_otp_use_case.dart';
import '../domain/value_objects/otp_method.dart';
import 'otp_verify_page.dart';

class OtpMethodPage extends StatelessWidget {
  final SendOtpUseCase sendOtpUseCase;
  final VerifyOtpUseCase verifyOtpUseCase;
  const OtpMethodPage({super.key, required this.sendOtpUseCase, required this.verifyOtpUseCase});

  Future<void> _select(BuildContext context, OtpMethod method) async {
    await sendOtpUseCase(method);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => OtpVerifyPage(verifyOtpUseCase: verifyOtpUseCase),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select OTP Method')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _select(context, OtpMethod.whatsapp),
              child: const Text('WhatsApp'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _select(context, OtpMethod.email),
              child: const Text('Email'),
            ),
          ],
        ),
      ),
    );
  }
}
