import 'package:flutter/material.dart';
import 'package:todo_app/style/style_color.dart';

class ChangeTextFieldWidget extends StatelessWidget {
  /// A customizable text field widget with validation support.
  const ChangeTextFieldWidget({
    super.key,
    required this.input,
    required this.hintText,
    this.lines,
  });
  final TextEditingController input;
  final String hintText;
  final int? lines;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: input,
      maxLines: lines,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.transparent,
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        errorStyle: TextStyle(color: Colors.red),
      ),
    );
  }
}
