import 'package:flutter/material.dart';

class CustomTheme {
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,

    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      // titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      titleSmall: TextStyle(color: Colors.white),

      displayLarge: TextStyle(color: Colors.white),
      displayMedium: TextStyle(color: Colors.white),
      displaySmall: TextStyle(color: Colors.white),

      bodyLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      bodySmall: TextStyle(color: Colors.white),
    ),
  );
}
