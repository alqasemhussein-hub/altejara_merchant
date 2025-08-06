import 'package:flutter/material.dart';

class CustomActionButton extends StatelessWidget {
  const CustomActionButton({
    super.key,
    required this.onPress,
    required this.colorSchema,
    required this.textTheme,
    required this.title,
    required this.iconData,
  });

  final Function()? onPress;
  final ColorScheme colorSchema;
  final TextTheme textTheme;
  final String title;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPress,
      icon: Icon(iconData, size: 16, color: colorSchema.onSurfaceVariant),
      label: Text(
        title,
        style: textTheme.bodyMedium!.copyWith(
          color: colorSchema.onSurfaceVariant,
        ),
      ),
      iconAlignment: IconAlignment.end,

      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: colorSchema.surfaceContainerLowest,
        // foregroundColor: colorSchema.surfaceContainerHighest,
        textStyle: textTheme.bodyMedium!.copyWith(
          color: colorSchema.onSurfaceVariant,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      ),
    );
  }
}
