import 'package:flutter/material.dart';
import 'package:todo_app/theme/colors_app.dart';

class AppThem {
  static ThemeData lightTheme = ThemeData(
    primaryColor: ColorsApp.primary,
    scaffoldBackgroundColor: ColorsApp.secondary,
    fontFamily: 'Alexandria',

    textTheme: TextTheme(
      bodyLarge: TextStyle(color: ColorsApp.white, fontSize: 16),
      bodyMedium: TextStyle(color: ColorsApp.white, fontSize: 14),
      titleLarge: TextStyle(color: ColorsApp.white, fontSize: 12),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsApp.secondary,
      elevation: 0,
      iconTheme: IconThemeData(color: ColorsApp.primary),
      titleTextStyle: TextStyle(
        color: ColorsApp.primary,
        fontSize: 16,
        fontFamily: 'Alexandria',
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
