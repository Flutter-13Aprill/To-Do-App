import 'package:flutter/material.dart';
import 'package:to_do_app_development/Screen/Splash_Screen.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app_development/Screen/Task/bloc/task_bloc.dart';

void main() {
  runApp(Provider<TaskBloc>(create: (_) => TaskBloc(), child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
