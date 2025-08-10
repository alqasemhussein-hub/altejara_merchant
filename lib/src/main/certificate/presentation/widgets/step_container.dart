import 'package:flutter/material.dart';

class StepContainer extends StatelessWidget {
  const StepContainer({
    Key? key,
    required this.title,
    this.subtitle,
    required this.child,
    this.loading = false,
  }) : super(key: key);
  final String title;
  final String? subtitle;
  final Widget child;
  final bool loading;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 8),
                Text(
                  subtitle ?? '',
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                ),
              ],
              const SizedBox(height: 24),
              child,
            ],
          ),
          if (loading)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.black12,
                ),
                alignment: Alignment.center,
                child: loading
                    ? CircularProgressIndicator()
                    : SizedBox.shrink(),
              ),
            ),
        ],
      ),
    );
  }
}
