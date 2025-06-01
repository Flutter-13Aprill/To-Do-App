import 'package:app/extension/Screen/get_size_screen.dart'; // Ensure this extension exists
import 'package:app/screen/Intro/first_onbording_scree.dart';
import 'package:app/screen/Intro/intro_screen/bloc/intro_bloc.dart';
import 'package:app/screen/widgets/conatiner/linear_conatiner.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IntroBloc()..add(IntroEvent()),
      child: BlocListener<IntroBloc, IntroState>(
        listener: (context, state) {
          if (state is IntroNavigateToOnboarding) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FirstOnbordingScree()),
            );
          }
        },
        child: Scaffold(
          body: Column(
            children: [
              const Spacer(),
              Center(child: Image.asset('assets/images/1.png')),
              // Reduced the vertical space between the image and the text
              const SizedBox(height: 20), // Changed from 150 to 20 (or adjust as needed)
              Text(
                "UpTodo".tr(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Spacer(),
              LinearConatiner(),
             ],
          ),
        ),
      ),
    );
  }
}