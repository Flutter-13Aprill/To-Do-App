import 'package:flutter/material.dart';
import 'package:todoapp/theems/colors.dart';

class NextButton extends StatelessWidget {
  final String button_text;
  final VoidCallback onPressed;
  final Color? color;
  final Color textColor;
  final double width;
  final Color? primary;
  const NextButton({
    super.key,
    required this.button_text,
    required this.onPressed,
    this.color,
    required this.textColor,
    required this.width,
    this.primary,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width, 50),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(5),
        ),
      ),
      onPressed: onPressed,
      child: Text(button_text, style: TextStyle(color: textColor)),
    );
  }
}
