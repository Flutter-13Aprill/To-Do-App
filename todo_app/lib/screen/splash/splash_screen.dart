import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/screen/onboarding/onboarding_screen.dart';
import 'package:todo_app/screen/splash/bloc/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc()..add(SplashEvent()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => OnboardingScreen()),
          );
        },
        child: Scaffold(
          body: Center(
            child: SizedBox(
              height: 180,
              width: 140,
              child: Image.asset('assets/images/Group 173.png'),
            ),
          ),
        ),
      ),
    );
  }
}
