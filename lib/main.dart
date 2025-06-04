import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:to_do_list/repositories/supabase.dart';
import 'package:to_do_list/screens/splash/splash_screen.dart';
import 'package:to_do_list/utilities/setup.dart';
import 'package:to_do_list/utilities/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseConnect.start();
  setup();

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final supabase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashScreen(), theme: Themes.theming);
  }
}
