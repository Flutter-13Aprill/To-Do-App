import 'package:flutter/material.dart';

class CustomCircleAvtar extends StatelessWidget {
  const CustomCircleAvtar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      foregroundImage: AssetImage("assets/images/profile.png"),
      radius: 40,
    );
  }
}
