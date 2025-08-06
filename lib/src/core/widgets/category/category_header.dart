import 'package:flutter/material.dart';

class CategoryHeader extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final void Function(String category) onSelected;
  final Color? backgroundColor;
  const CategoryHeader({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onSelected,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return Container(
      color: backgroundColor ?? colorScheme.surface,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: categories.map((category) {
          final isSelected = selectedCategory == category;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilterChip(
              label: Text(category),
              selected: isSelected,
              onSelected: (_) => onSelected(category),
              showCheckmark: false,
              backgroundColor: colorScheme.surfaceContainerHigh,
              selectedColor: colorScheme.surfaceContainerHighest,
              labelStyle: theme.textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurface,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  width: 2,
                  color: isSelected
                      ? colorScheme.outlineVariant
                      : Colors.transparent,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
