import 'package:flutter/material.dart';
import 'package:project6/core/service_locator/setup.dart';
import 'package:project6/core/theme/app_theme.dart';
import 'package:project6/feature/home/presentation/page/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: HomePage(),
    );
  }
}
