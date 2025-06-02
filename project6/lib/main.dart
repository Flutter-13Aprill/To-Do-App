import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project6/repo/supabase.dart';
import 'package:project6/screens/splash_screen.dart';
import 'package:project6/theme/app_theming.dart';
import 'package:project6/units/setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SupabaseConnect.init();
  setup();
  runApp(
    ScreenUtilInit(
      designSize: Size(372, 812),
      child: EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('de', 'DE')],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: Locale('en', 'US'),

        child: MainApp(),
      ),
    ),
  );
  ;
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheming().appTheming,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: SplashScreen(),
    );
  }
}
