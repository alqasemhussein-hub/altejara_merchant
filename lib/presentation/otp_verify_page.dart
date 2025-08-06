import 'package:flutter/material.dart';
import '../application/use_cases/verify_otp_use_case.dart';
import 'home_page.dart';

class OtpVerifyPage extends StatefulWidget {
  final VerifyOtpUseCase verifyOtpUseCase;
  const OtpVerifyPage({super.key, required this.verifyOtpUseCase});

  @override
  State<OtpVerifyPage> createState() => _OtpVerifyPageState();
}

class _OtpVerifyPageState extends State<OtpVerifyPage> {
  final _codeController = TextEditingController();
  String? _error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify OTP')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _codeController, decoration: const InputDecoration(labelText: 'OTP Code')),
            if (_error != null) Text(_error!, style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final ok = await widget.verifyOtpUseCase(_codeController.text);
                if (ok) {
                  if (!mounted) return;
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const HomePage()),
                    (_) => false,
                  );
                } else {
                  setState(() => _error = 'Invalid code');
                }
              },
              child: const Text('Verify'),
            ),
          ],
        ),
      ),
    );
  }
}
