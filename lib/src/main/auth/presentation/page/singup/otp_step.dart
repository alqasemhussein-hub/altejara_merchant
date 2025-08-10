// Step 4: OTP Verification
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Step4OtpVerification extends StatelessWidget {
  final List<TextEditingController> otpControllers;
  final VoidCallback onPrevious;

  Step4OtpVerification({
    required this.otpControllers,
    required this.onPrevious,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'قم بإدخال رمز الـ OTP المرسل إلى بريدك الإلكتروني',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 50),
          // OTP input fields
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(6, (index) {
              return Container(
                width: 45,
                height: 55,
                child: TextField(
                  controller: otpControllers[index],
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    counterText: '',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: EdgeInsets.zero,
                  ),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (value) {
                    if (value.isNotEmpty && index < 5) {
                      FocusScope.of(context).nextFocus();
                    } else if (value.isEmpty && index > 0) {
                      FocusScope.of(context).previousFocus();
                    }
                  },
                ),
              );
            }),
          ),
          SizedBox(height: 100),
          // Confirm button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Handle OTP verification
                _showSuccessDialog(context);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'تأكيد',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('نجح التسجيل'),
          content: Text('تم تسجيل حسابك بنجاح'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Navigate to home or login screen
              },
              child: Text('موافق'),
            ),
          ],
        );
      },
    );
  }
}
