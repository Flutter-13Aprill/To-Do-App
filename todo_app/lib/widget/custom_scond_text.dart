import 'package:flutter/material.dart';

class CustomScondText extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  const CustomScondText({
    super.key,
    required this.text,
    this.color,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 16, color: color),
      textAlign: textAlign,
    );
  }
}
