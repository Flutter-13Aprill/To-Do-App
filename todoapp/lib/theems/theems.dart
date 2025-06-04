import 'package:flutter/material.dart';
import 'package:todoapp/theems/colors.dart';

class CustomeTheem {
  static final todoapp = ThemeData(
    textTheme: ThemeData().textTheme.apply(
      bodyColor: MyAppColor.white,
      displayColor: MyAppColor.white,
    ),
    scaffoldBackgroundColor: MyAppColor.black,
    appBarTheme: AppBarTheme(color: MyAppColor.black),
  );
}
