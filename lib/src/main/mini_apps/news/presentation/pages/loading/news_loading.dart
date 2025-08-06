import 'package:flutter/material.dart';

class NewsCardSkeleton extends StatelessWidget {
  const NewsCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 18, width: 150, color: Colors.grey[300]),
          const SizedBox(height: 8),
          Container(
            height: 14,
            width: double.infinity,
            color: Colors.grey[300],
          ),
          const SizedBox(height: 6),
          Container(
            height: 14,
            width: double.infinity,
            color: Colors.grey[300],
          ),
          const SizedBox(height: 6),
          Container(height: 14, width: 200, color: Colors.grey[300]),
        ],
      ),
    );
  }
}
