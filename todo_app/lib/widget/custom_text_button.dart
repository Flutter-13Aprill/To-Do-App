import 'package:flutter/material.dart';
import 'package:todo_app/theme/colors_app.dart';

class CustomTextButton extends StatelessWidget {
  final Function() onPressed;
  final double fontSize;
  final String text;
  final Color color;
  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.fontSize,
    required this.text,
    this.color = ColorsApp.secondText,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text, style: TextStyle(fontSize: fontSize, color: color)),
    );
  }
}
