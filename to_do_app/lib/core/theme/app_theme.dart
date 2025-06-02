
import 'package:to_do_app/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: AppPalette.backgroundColor,
    appBarTheme: AppBarTheme(backgroundColor: AppPalette.backgroundColor,iconTheme: IconThemeData(color: AppPalette.textColor),titleTextStyle: TextStyle(color: AppPalette.textColor),),
    textButtonTheme: TextButtonThemeData(
  style: TextButton.styleFrom(
    foregroundColor: AppPalette.textColor,
  ),
),textSelectionTheme: TextSelectionThemeData(),
    primaryTextTheme: TextTheme(
      displayLarge:TextStyle(color:AppPalette.textColor) ,
      displayMedium:TextStyle(color:AppPalette.textColor) ,
      displaySmall:TextStyle(color:AppPalette.textColor) ,
      headlineLarge:TextStyle(color:AppPalette.textColor) ,
      headlineMedium:TextStyle(color:AppPalette.textColor) ,
      headlineSmall:TextStyle(color:AppPalette.textColor) ,
      titleLarge:TextStyle(color:AppPalette.textColor),
      titleMedium:TextStyle(color:AppPalette.textColor) ,
      titleSmall:TextStyle(color:AppPalette.textColor) ,
      bodyLarge:TextStyle(color:AppPalette.textColor) ,
      bodyMedium:TextStyle(color:AppPalette.textColor) ,
      bodySmall:TextStyle(color:AppPalette.textColor) ,
      labelLarge:TextStyle(color:AppPalette.textColor) ,
      labelMedium:TextStyle(color:AppPalette.textColor) ,
      labelSmall:  TextStyle(color:AppPalette.textColor)
      ),
      textTheme: TextTheme(
      displayLarge:TextStyle(color:AppPalette.textColor) ,
      displayMedium:TextStyle(color:AppPalette.textColor) ,
      displaySmall:TextStyle(color:AppPalette.textColor) ,
      headlineLarge:TextStyle(color:AppPalette.textColor) ,
      headlineMedium:TextStyle(color:AppPalette.textColor) ,
      headlineSmall:TextStyle(color:AppPalette.textColor) ,
      titleLarge:TextStyle(color:AppPalette.textColor),
      titleMedium:TextStyle(color:AppPalette.textColor) ,
      titleSmall:TextStyle(color:AppPalette.textColor) ,
      bodyLarge:TextStyle(color:AppPalette.textColor) ,
      bodyMedium:TextStyle(color:AppPalette.textColor) ,
      bodySmall:TextStyle(color:AppPalette.textColor) ,
      labelLarge:TextStyle(color:AppPalette.textColor) ,
      labelMedium:TextStyle(color:AppPalette.textColor) ,
      labelSmall:  TextStyle(color:AppPalette.textColor)

      )
    
  
  );
}
