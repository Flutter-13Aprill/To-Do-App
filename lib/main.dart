import 'package:uptodo/core/helpers/set_up_getit.dart';
import 'package:uptodo/core/theme/app_theme.dart';
import 'package:uptodo/core/connection_supabase.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:uptodo/features/bottom_nav/presentation/bottom_nav_screen.dart';
import 'package:uptodo/features/home/presentation/home_screen.dart';
import 'package:uptodo/features/onboarding/presentation/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  
  await ConnectionSupabase.init();

  setUpGetIt();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'AR')],
      path:'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('en', 'US'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: OnboardingScreen(),
    );
  }
}
