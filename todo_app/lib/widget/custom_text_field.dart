import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;

  final String? labelText;
  final String? errorText;
  final TextInputType keyboardType;
  final void Function(String) onChanged;
  final String hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  // final int? maxLines;

  const CustomTextField({
    super.key,
    required this.controller,
    this.labelText,
    this.keyboardType = TextInputType.text,
    this.errorText,
    required this.onChanged,
    required this.hintText,
    this.obscureText = false,
    this.validator,
    // this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // maxLines: maxLines,
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        errorText: errorText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
