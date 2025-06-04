import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/loading/bloc/loading_bloc.dart';
import 'package:todo_app/features/nav/navigation_bar_screen.dart';
import 'package:todo_app/features/onboarding/screen/onboarding_screen.dart';

/// [LoadingScreen] listens to [LoadingBloc] and shows a loading indicator.
///
/// On success, it navigates to [NavigationBarScreen].
/// On error, it navigates to [OnboardingScreen].
class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<LoadingBloc>().add(StartLoadEvent());
    return BlocListener<LoadingBloc, LoadingState>(
      listener: (context, state) {
        if (state is SuccessState) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => NavigationBarScreen()),
          );
        }
        if (state is ErrorState) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => OnboardingScreen()),
          );
        }
      },
      child: Scaffold(body: Center(child: CircularProgressIndicator())),
    );
  }
}
