import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import 'package:to_do_app_development/Screen/Onboarding_Screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Show system UI (status + navigation bars)
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    // Start the 3-second timer for navigation
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
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
