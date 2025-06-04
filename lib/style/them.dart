import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.black,
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 18),
    ),
  );
}
