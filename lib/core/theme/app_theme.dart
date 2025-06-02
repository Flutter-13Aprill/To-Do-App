import 'package:flutter/material.dart';
import 'package:uptodo/core/text/text_styles.dart';
import 'package:uptodo/core/theme/app_palette.dart';

class AppTheme {

  static final appTheme = ThemeData(
    scaffoldBackgroundColor: AppPalette.scaffoldBackgroundColor,

    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppPalette.scaffoldBackgroundColor,
      indicatorColor: AppPalette.scaffoldBackgroundColor,
      labelTextStyle: WidgetStatePropertyAll(TextStyles.lato40018)
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: AppPalette.scaffoldBackgroundColor
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: CircleBorder(),
      backgroundColor: AppPalette.primaryFloatingColor,
      foregroundColor: Colors.white
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: AppPalette.disabledBackgroundButtonColor ,
        backgroundColor: AppPalette.primaryBackgroundButtonColor,
        foregroundColor: Colors.white,
        textStyle: TextStyles.lato40018,
        fixedSize: Size(98, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(4)
        )
      )
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        fixedSize: Size(98, 48),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: AppPalette.primaryBackgroundButtonColor),
          borderRadius: BorderRadiusGeometry.circular(4)
        )
      ),
    ),

    datePickerTheme: DatePickerThemeData(
      backgroundColor: AppPalette.backgroundDatePickerColor
    )
  );
}