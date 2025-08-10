import 'package:flutter/material.dart';
import 'package:techara_merchant/src/core/style/theme/cache_theme.dart';
import 'package:techara_merchant/utils/injector.dart';

class CustomDropDownField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const CustomDropDownField({
    Key? key,
    required this.label,
    required this.controller,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          hint: Text('اختر $label'),
          value: controller.text.isEmpty ? null : controller.text,
          style: getIt<ThemeService>().textTheme.titleMedium,

          items: items.map((String item) {
            return DropdownMenuItem<String>(value: item, child: Text(item));
          }).toList(),
          onChanged: (v) {
            controller.text = v ?? '';
            onChanged(v);
          },
          decoration: InputDecoration(
            hintStyle: getIt<ThemeService>().textTheme.titleSmall?.copyWith(
              color: getIt<ThemeService>().colorScheme.onSurface.withAlpha(150),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.transparent),
            ),

            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
          ),

          validator: (value) =>
              value == null || value.isEmpty ? 'يرجى إدخال $label' : null,
        ),
      ],
    );
  }
}
