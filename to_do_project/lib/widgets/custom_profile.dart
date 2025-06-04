import 'package:flutter/material.dart';

class CustomProfile extends StatelessWidget {
  const CustomProfile({super.key, required this.text, required this.icon});
  final Widget icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Row(
      children: [
        icon,
        SizedBox(width: 16),
        Text(text),
      ],
    ),
  );
  }
}