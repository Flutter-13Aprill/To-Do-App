import 'package:to_do_app/core/extensions/navigation/navigation.dart';
import 'package:to_do_app/features/auth/registertion/registertion_screen.dart';
import 'package:to_do_app/features/loading/bloc/loading_bloc.dart';
import 'package:to_do_app/features/bottom_controller/bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/features/onboarding/onboarding_screen.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<LoadingBloc>().add(StartLoadEvent());
    return BlocListener<LoadingBloc, LoadingState>(
      listener: (context, state) {
        if (state is SuccessState) {
         context.replacement(BottomNavScreen());
        }
        if (state is ErrorState) {
        context.replacement(OnboardingScreen());
        }
      },
      child: Scaffold(body: Center(child: CircularProgressIndicator())),
    );
  }
}
