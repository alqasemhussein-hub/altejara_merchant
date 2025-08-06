import 'package:flutter/material.dart';
import '../application/use_cases/login_use_case.dart';
import '../application/use_cases/send_otp_use_case.dart';
import '../application/use_cases/verify_otp_use_case.dart';
import 'otp_method_page.dart';

class LoginPage extends StatefulWidget {
  final LoginUseCase loginUseCase;
  final SendOtpUseCase sendOtpUseCase;
  final VerifyOtpUseCase verifyOtpUseCase;
  const LoginPage({super.key, required this.loginUseCase, required this.sendOtpUseCase, required this.verifyOtpUseCase});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userController = TextEditingController();
  final _passController = TextEditingController();
  String? _error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _userController, decoration: const InputDecoration(labelText: 'Username')),
            TextField(controller: _passController, obscureText: true, decoration: const InputDecoration(labelText: 'Password')),
            if (_error != null) Text(_error!, style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final user = await widget.loginUseCase(_userController.text, _passController.text);
                if (user != null) {
                  if (!mounted) return;
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => OtpMethodPage(
                      sendOtpUseCase: widget.sendOtpUseCase,
                      verifyOtpUseCase: widget.verifyOtpUseCase,
                    ),
                  ));
                } else {
                  setState(() => _error = 'Invalid credentials');
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
