import 'package:flutter/material.dart';
import 'package:to_do_project/core/text/text_style.dart';
import 'package:to_do_project/core/theme/app_palete.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: AppPalete.background,
    appBarTheme: AppBarTheme(
      backgroundColor: AppPalete.background,
      centerTitle: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(302, 46),
        backgroundColor: AppPalete.buttton,
        foregroundColor: AppPalete.text,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        textStyle: TextStyles.lato400s16,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(AppPalete.text),
        textStyle: WidgetStateProperty.all(TextStyles.lato400s16),
      ),
    ),
  );
}
