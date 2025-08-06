// The login screen with sign-in buttons
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:techara_merchant/src/main/home/main_page.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  final bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isLoading)
              const CircularProgressIndicator()
            else
              ElevatedButton(
                onPressed: () {
                  // Simulate a login action
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MainPage()),
                  );
                },
                child: const Text('Login with Google'),
              ),
            if (Platform.isIOS)
              ElevatedButton(
                onPressed: () {
                  // Simulate Apple login action
                },
                child: const Text('Login with Apple'),
              ),
          ],
        ),
      ),
    );
  }
}
