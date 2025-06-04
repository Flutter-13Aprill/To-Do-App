import 'package:flutter/material.dart';
import 'package:todo_app/style/style_color.dart';

class CustomTheme {
  static final darkTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: StyleColor.grey,
      onPrimary: Colors.white,
      secondary: StyleColor.purple,
      onSecondary: Colors.white,
      error: StyleColor.red,
      onError: Colors.grey,
      surface: StyleColor.purple,
      onSurface: Colors.white,
    ),
    scaffoldBackgroundColor: StyleColor.black,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        alignment: Alignment.center,
        elevation: WidgetStateProperty.all(0),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        backgroundColor: WidgetStateProperty.all(StyleColor.purple),
        foregroundColor: WidgetStateProperty.all(Colors.white),
        overlayColor: WidgetStatePropertyAll(Colors.grey.shade600),
      ),
    ),
    listTileTheme: ListTileThemeData(tileColor: Colors.transparent),
    appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: StyleColor.grey,
      selectedItemColor: Colors.white,
    ),
  );
}
