<<<<<<< HEAD

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
=======
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
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    WidgetsBinding.instance.addPostFrameCallback((_) => _startTimer(context));
=======
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
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
