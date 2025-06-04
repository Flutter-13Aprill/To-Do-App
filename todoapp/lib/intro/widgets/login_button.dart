import 'package:flutter/material.dart';
import 'package:todoapp/theems/colors.dart';

class LoginButton extends StatelessWidget {
  final String button_text;
  final VoidCallback next;
  final MaterialColor color;
  final MaterialColor textColor;
  final double width;
  const LoginButton({
    super.key,
    required this.button_text,
    required this.next,
    required this.color,
    required this.textColor,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width, 12),
        backgroundColor: color,
      ),
      onPressed: next,
      child: Text(button_text, style: TextStyle(color: textColor)),
    );
  }
}
