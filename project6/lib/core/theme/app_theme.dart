import 'package:flutter/material.dart';
import 'package:project6/core/text/text_styles.dart';
import 'package:project6/core/theme/app_palette.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: AppPalette.blackColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppPalette.blackColor,
      foregroundColor: AppPalette.whiteColor,
      centerTitle: true,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppPalette.lightBlack2,
      selectedItemColor: AppPalette.whiteColor,
      unselectedItemColor: AppPalette.grayColor,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppPalette.lightPurple,
      foregroundColor: AppPalette.whiteColor,
      shape: CircleBorder(),
      iconSize:32,
      sizeConstraints:BoxConstraints(
        minWidth: 64,
        minHeight: 64,

      )
    ),
    //Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(4),
          side: BorderSide(color: AppPalette.purpleColor, width: 2),
        ),
      ),
    ),
    //input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppPalette.lightBlack,
      hintStyle: TextStyles.lato40016.copyWith(color: AppPalette.lightGray),
      focusedBorder: _border(AppPalette.grayColor),
      enabledBorder: _border(AppPalette.grayColor),
    ),

    //Text Button Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size(1, 0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    ),
  );
  //Outline Input Border Method
  static OutlineInputBorder _border(Color borderColor) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: AppPalette.lightGray2, width: 0.8),
    );
  }
}
