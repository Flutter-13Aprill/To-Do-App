import 'package:flutter/material.dart';
import 'package:project7/screen/nav/bottom_nav_screen.dart';
import 'package:project7/utilit/setup.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:project7/screen/index_screen.dart';
// import 'package:project7/screen/nav/bottom_nav_screen.dart';
// import 'package:project7/splash/splash_screen.dart';
// import 'package:project7/utilit/setup.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://utdxqqlyxtpruaapqdch.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InV0ZHhxcWx5eHRwcnVhYXBxZGNoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDkwMTE0NjQsImV4cCI6MjA2NDU4NzQ2NH0.FN9cZzxdxu-HDe6LM4yVBocKs2PV1G2JKZv7XAIDRBg',
  );
  setup(); //getit
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: BottomNavScreen());
  }
}
