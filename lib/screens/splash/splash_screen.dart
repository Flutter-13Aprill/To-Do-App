import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/screens/home/index/index.dart';
import 'package:to_do_list/screens/onboarding/onboarding_screen.dart';
import 'package:to_do_list/screens/splash/bloc/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc(),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          Future.delayed(Duration(seconds: 3), () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => IndexScreen()),
            );
          });
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image.asset("assets/images/Up Todo.png")),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => OnboardingScreen()),
                  );
                },
                child: Text("To the Onboarding"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
