import 'package:app/repo/supabase.dart';
import 'package:app/screen/Intro/first_onbording_scree.dart';
import 'package:app/screen/Intro/intro_screen/Intro_screen.dart';
import 'package:app/screen/Intro/intro_screen/third_onbording_screen.dart';
import 'package:app/screen/Intro/second_onbording_scree.dart';
import 'package:app/screen/Intro/start_screen.dart';
import 'package:app/screen/index/home_screen.dart';
import 'package:app/screen/auth/login_and_register/login/login_screen.dart';
import 'package:app/screen/auth/login_and_register/register/register_screen.dart';
import 'package:app/screen/nav/botom_nav_bar_screen.dart';
import 'package:app/theme/custom_theme.dart';
import 'package:app/utilts/setup.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
await SupabaseConnect.init();
  setUp();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'AR')],
      path:
          'assets/translations', // <-- change the path of the translation files
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
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

      debugShowCheckedModeBanner: false,
       theme: CustomTheme.darkTheme,
      // darkTheme: CustomTheme.darkTheme,
      home:   BotomNavBarScreen(),
    );
  }
}
