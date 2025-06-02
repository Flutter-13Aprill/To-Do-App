import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_app/repo/supabase.dart';
import 'package:to_do_app/screen/intro/intro_screen.dart';
import 'package:to_do_app/style/app_theme.dart';
import 'package:to_do_app/utilts/setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // to Initialized supabase
  await SupabaseConnect.init();
  // to get data from supabase before app buld
  setup();
  await SupabaseConnect.getTasks();

  // Only orientation for this app is Portia up
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    // to support multi language
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'AR')],
      path: 'assets/translations', //
      fallbackLocale: Locale('en', 'US'),

      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of My application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

      theme: AppTheme.myStyle,
      home: IntroScreen(),
    );
  }
}
