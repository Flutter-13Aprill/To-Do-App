import 'package:flutter/material.dart';
import 'package:to_do_project/core/repo/supabase.dart';
import 'package:to_do_project/core/setup/set_up.dart';

import 'package:to_do_project/core/theme/app_theme.dart';

import 'package:to_do_project/featuers/splash/presentation/pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SupabaseStart.init();
  setup();
  //call the subabase
  //await SupabaseStart.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashScreen(), theme: AppTheme.theme);
  }
}
