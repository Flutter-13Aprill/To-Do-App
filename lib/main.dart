import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:getit/Screens/onboarding/onboarding_screen.dart';
import 'package:getit/Styles/colors.dart';
import 'package:getit/utilities/setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setup();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale("ar")],
      path: 'assets/translations',
      fallbackLocale: Locale('en', 'US'),
      startLocale: Locale('en', 'US'),

      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: Theme.of(context).copyWith(
        appBarTheme: Theme.of(
          context,
        ).appBarTheme.copyWith(backgroundColor: backgroundColor),
        textTheme: Theme.of(context).textTheme.apply(
          displayColor: mainText,
          bodyColor: mainText,
          decorationColor: mainText,
        ),
        scaffoldBackgroundColor: backgroundColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ),
      home: OnboardingScreen(),
    );
  }
}
