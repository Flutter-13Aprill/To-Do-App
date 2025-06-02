import 'package:flutter/material.dart';

class AppTheming {
  final appTheming = ThemeData(
    scaffoldBackgroundColor: Color.fromARGB(255, 29, 29, 29),
    appBarTheme: AppBarTheme(color: Color.fromARGB(255, 29, 29, 29)),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 32,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
           titleMedium: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
    ),

  );
}
