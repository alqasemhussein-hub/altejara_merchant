import 'dart:ui';

import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({Key? key, required this.child, this.bottoWidget})
    : super(key: key);
  final Widget child;
  final Widget? bottoWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            // padding: const EdgeInsets.only(bottom: 20),
            child: Transform.scale(
              scale: 1.3,
              child: Transform.rotate(
                angle: 0.16,
                child: Stack(
                  children: [
                    Positioned(
                      left: -80,
                      top: -80,
                      child: Container(
                        width: 350,
                        height: 340,
                        decoration: BoxDecoration(
                          color: const Color(0xffFFC93E),
                          borderRadius: BorderRadius.circular(200),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: -80,
                      right: -40,
                      child: Container(
                        alignment: Alignment.topRight,
                        width: 350,
                        height: 300,
                        decoration: BoxDecoration(
                          color: const Color(0xffB81F1E),
                          borderRadius: BorderRadius.circular(200),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                      ),
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                      child: Container(color: Colors.transparent),
                    ),
                  ],
                ),
              ),
            ),
          ),

          child,
        ],
      ),
      bottomNavigationBar: bottoWidget,
    );
  }
}
