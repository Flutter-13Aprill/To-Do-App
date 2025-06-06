import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/screens/intro/bloc/intro_bloc.dart';
import 'package:todo_list/screens/onboarding/onboarding_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IntroBloc(),
      child: Builder(
        builder: (context) {
          context.read<IntroBloc>().add(SkipIntroEvent());
          return BlocListener<IntroBloc, IntroState>(
            listener: (context, state) {
              if (state is SuccessLoadingState) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => OnboardingScreen()),
                  (value) => false,
                );
              }
            },
            child: Scaffold(
              body: Center(
                child: Image.asset(
                  "assets/images/logo.png",
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
