import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, required this.press, required this.child});
  final VoidCallback press;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: press, child: child);
  }
}
