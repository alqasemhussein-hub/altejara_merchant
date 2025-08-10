import 'package:flutter/material.dart';

class CustomDateField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? onValidate;
  const CustomDateField({
    Key? key,
    required this.label,
    required this.controller,
    required this.hintText,
    this.onValidate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          readOnly: true,

          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.transparent, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.transparent, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.transparent, width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.red, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.red, width: 1),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
            suffixIcon: Icon(Icons.calendar_today),

            suffixIconConstraints: const BoxConstraints(
              minWidth: 48,
              minHeight: 48,
            ),
          ),
          validator: (value) => onValidate?.call(value),
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2020),
              lastDate: DateTime(2030),
            );
            if (date != null) {
              controller.text =
                  '${date.year.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
            }
          },
        ),
      ],
    );
  }
}
