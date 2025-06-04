
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:to_do_app_development/Screen/Onboarding_Screen.dart';

// ignore: must_be_immutable
class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  bool _navigated = false;

  void _startTimer(BuildContext context) {
    if (!_navigated) {
      _navigated = true;

      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

      Timer(const Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => OnboardingScreen()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _startTimer(context));
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: Center(
        child: Image.asset(
          'assets/Splash.png',
          width: 140,
          height: 180,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
