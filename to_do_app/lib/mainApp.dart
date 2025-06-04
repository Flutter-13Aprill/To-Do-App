
import 'package:flutter/material.dart';
import 'package:to_do_app/Theme/app_theme.dart';
import 'package:to_do_app/views/onBoarding/on_boarding_view.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      // localizationsDelegates: context.localizationDelegates,
      // supportedLocales: context.supportedLocales,
      // locale: context.locale,
      home: const OnBoardingView()
      // SplashView()
    );
  }
}
