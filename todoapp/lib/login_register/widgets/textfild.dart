import 'package:flutter/material.dart';
import 'package:todoapp/theems/colors.dart';

class Textfild extends StatelessWidget {
  final String hinttext;
  final TextEditingController controller;

  final String? Function(String?)? validator;
  final bool obscureText;
  const Textfild({
    super.key,
    required this.hinttext,
    required this.controller,
    this.validator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      style: TextStyle(color: MyAppColor.white),
      decoration: InputDecoration(
        hintText: hinttext,
        border: OutlineInputBorder(),
      ),
    );
  }
}
