import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  /// A reusable text field widget with label, hint, and validation.
  const TextFieldWidget({
    super.key,

    this.validate,
    required this.controller,
    required this.textHint,
  });

  /// Controller to manage the text input
  final TextEditingController controller;

  /// Hint text shown inside the text field
  final String textHint;

  /// validator function for input validation
  final String? Function(String?)? validate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,

      decoration: InputDecoration(
        hintText: textHint,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      validator: validate,
    );
  }
}
