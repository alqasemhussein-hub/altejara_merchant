import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key, this.backgroundColor});
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color:
            backgroundColor ??
            colorScheme.primary.withAlpha((255 * 0.08).toInt()),

        borderRadius: BorderRadius.circular(32),
      ),
      child: Row(
        spacing: 8,
        children: [
          const Icon(LucideIcons.cloudSun, size: 30),
          Text("33°", style: textTheme.headlineMedium),
          Wrap(
            direction: Axis.vertical,
            children: [
              Text("Partly Cloudy", style: textTheme.labelSmall),
              Text("Baghdad", style: textTheme.labelSmall),
            ],
          ),
        ],
      ),
    );
  }
}
