import 'package:flutter/material.dart';
import 'package:techara_merchant/src/core/style/theme/cache_theme.dart';
import 'package:techara_merchant/utils/injector.dart';

class CustomTextForm extends StatefulWidget {
  const CustomTextForm({
    super.key,
    required TextEditingController controller,
    this.isPasswordVisible = false,
    this.hintText,
    this.suffixWidget,
    this.onValidate,
    this.keyboardType,
    this.enable = true,
    this.maxLines = 1,
    this.title,
    this.onEdit,
  }) : _controller = controller;

  final TextEditingController _controller;
  final bool isPasswordVisible;
  final String? hintText;
  final int maxLines;
  final Widget? suffixWidget;
  final TextInputType? keyboardType;
  final String? Function(String?)? onValidate;

  final String? Function(String?)? onEdit;
  final bool enable;
  final String? title;
  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, right: 8, left: 8),
            child: Text(
              widget.title!,
              style: getIt<ThemeService>().textTheme.titleMedium,
            ),
          ),
        TextFormField(
          maxLines: widget.maxLines,
          keyboardType: widget.keyboardType,
          controller: widget._controller,
          obscureText: widget.isPasswordVisible && !_isPasswordVisible,
          enabled: widget.enable,
          readOnly: widget.enable == false,
          onChanged: widget.onEdit,
          style: getIt<ThemeService>().textTheme.titleMedium,

          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: getIt<ThemeService>().textTheme.titleSmall?.copyWith(
              color: getIt<ThemeService>().colorScheme.onSurface.withAlpha(150),
            ),
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
            prefixIcon: widget.isPasswordVisible
                ? Padding(
                    padding: EdgeInsets.only(left: 16, right: 8),
                    child: Icon(
                      Icons.lock_outline,
                      color: Color(0xFF8E8E93),
                      size: 18,
                    ),
                  )
                : widget.suffixWidget,
            prefixIconConstraints:
                widget.isPasswordVisible || widget.suffixWidget != null
                ? BoxConstraints(minWidth: 48, minHeight: 48)
                : null,
            suffixIcon: widget.isPasswordVisible == true
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Icon(
                        _isPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,

                        size: 22,
                      ),
                    ),
                  )
                : null,
            suffixIconConstraints: const BoxConstraints(
              minWidth: 48,
              minHeight: 48,
            ),
          ),
          validator: (value) => widget.onValidate?.call(value),
        ),
      ],
    );
  }
}
