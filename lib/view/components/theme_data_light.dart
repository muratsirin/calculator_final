import 'package:calculator_final/constants.dart';
import 'package:flutter/material.dart';

ThemeData themeDataLight(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: kPrimaryColorLight,
    primaryIconTheme: IconThemeData(
      color: kPrimaryTextColorLight,
    ),
    scaffoldBackgroundColor: kPrimaryColorLight,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        headline6: TextStyle(
          color: kPrimaryTextColorLight,
          fontSize: 20,
        ),
      ),
    ),
    textTheme: Theme.of(context).textTheme.apply(
          bodyColor: kPrimaryTextColorLight,
          displayColor: kPrimaryTextColorLight,
        ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: kPrimaryTextColorLight,
      ),
    ),
  );
}
