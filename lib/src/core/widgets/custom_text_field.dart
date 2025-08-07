import 'package:flutter/material.dart';

class CustomTextForm extends StatefulWidget {
  const CustomTextForm({
    super.key,
    required TextEditingController controller,
    this.isPasswordVisible = false,
    this.hintText,
    this.suffixWidget,
    this.onValidate,
  }) : _controller = controller;

  final TextEditingController _controller;
  final bool isPasswordVisible;
  final String? hintText;

  final Widget? suffixWidget;

  final String? Function(String?)? onValidate;

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget._controller,
      obscureText: widget.isPasswordVisible && !_isPasswordVisible,

      decoration: InputDecoration(
        hintText: widget.hintText,
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
        suffixIcon: widget.isPasswordVisible
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
                    color: Colors.transparent,
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
    );
  }
}
