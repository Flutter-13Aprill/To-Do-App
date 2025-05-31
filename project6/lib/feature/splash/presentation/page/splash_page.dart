import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project6/core/extension/navigation.dart';
import 'package:project6/core/text/app_text.dart';
import 'package:project6/core/text/text_styles.dart';
import 'package:project6/feature/auth/presentation/page/start_page.dart';
import 'package:project6/feature/onboarding/presentation/page/onboarding_page.dart';
import 'package:project6/feature/splash/presentation/bloc/splash_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc()..add(CheckFirstTimeUserEvent()),

      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is FirstTimeUseApp) {
            context.customPushReplacement(OnboardingPage());
          } else if (state is NotFirstTimeUseApp) {
            context.customPushReplacement(StartPage());
          }
        },
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 113,
                  width: 113,
                  child: Image.asset(
                    "asset/image/splash.png",
                    fit: BoxFit.contain,
                  ),
                ),
                Text(AppText.upTodo, style: TextStyles.lato70040),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
