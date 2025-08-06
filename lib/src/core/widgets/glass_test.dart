import 'dart:ui';

import 'package:flutter/material.dart';

class GlassCardTest extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  final double borderRadius;
  final double blur;
  final Color color;
  final double colorOpacity;
  final Color borderColor;
  final double borderOpacity;
  final double borderWidth;

  const GlassCardTest({
    super.key,
    required this.height,
    required this.width,
    required this.child,
    this.borderRadius = 20.0,
    this.blur = 10.0,
    this.color = Colors.grey,
    this.colorOpacity = 0.1,
    this.borderColor = Colors.white,
    this.borderOpacity = 0.2,
    this.borderWidth = 1.5,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          // Bottom-right shadow (dark)
          BoxShadow(
            color: Colors.white.withAlpha(100),
            offset: const Offset(-1, -1),
            blurRadius: 3,
            spreadRadius: -1,
            blurStyle: BlurStyle.outer,
          ),
          // Top-left shadow (light)
          // BoxShadow(
          //   color: Colors.white.withAlpha(100),
          //   offset: const Offset(-1, -1),
          //   blurRadius: 30,
          //   spreadRadius: 0.5,
          //   blurStyle: BlurStyle.inner,
          // ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            height: height,
            width: width,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withOpacity(colorOpacity),
              borderRadius: BorderRadius.circular(borderRadius),
              // border: Border.all(
              //   color: borderColor.withOpacity(borderOpacity),
              //   width: borderWidth,
              // ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

/// A card widget that mimics the Apple visionOS glass style.
class AppleGlassCard extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  final double borderRadius;
  final double blur;

  const AppleGlassCard({
    super.key,
    required this.height,
    required this.width,
    required this.child,
    this.borderRadius = 30.0,
    this.blur = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // This outer container is for the shadow
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              // The gradient creates the subtle sheen and inner border effect
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withOpacity(0.2),
                  Colors.white.withOpacity(0.05),
                ],
                stops: const [0.0, 1.0],
              ),
              // The border defines the crisp outer edge
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
