import 'package:flutter/material.dart';
import 'package:to_do_app/screen/onboading/onboading_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Wait for 5 seconds, then navigate to IntrosScreen
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboadingScreen()),
      );
    });
    return Scaffold(body: Center(child: Image.asset("images/logo.png")));
  }
}
