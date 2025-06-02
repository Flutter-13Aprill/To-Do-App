import 'package:flutter/material.dart';
import 'package:project6/core/text/text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.text,
    required this.labelText,
    this.obscureText = false,
    this.validator,
  });
  final TextEditingController controller;
  final String text;
  final String labelText;
  final bool? obscureText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: TextStyles.lato40016),
        SizedBox(height: 8),
        TextFormField(
          style: TextStyles.lato40016,
          controller: controller,
          obscureText: obscureText!,
          decoration: InputDecoration(hintText: text),
          validator: validator,
        ),
      ],
    );
  }
}
