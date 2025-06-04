import 'package:flutter/material.dart';

class CustomMainText extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final double fontSize;

  const CustomMainText({
    super.key,
    required this.text,
    this.color,
    this.textAlign,
    this.fontSize = 32,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}
