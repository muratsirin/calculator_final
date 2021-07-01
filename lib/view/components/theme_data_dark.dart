import 'package:flutter/material.dart';
import '../../constants.dart';

ThemeData themeDataDark(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: kPrimaryColorDark,
    primaryIconTheme: IconThemeData(
      color: kPrimaryTextColorDark,
    ),
    canvasColor: kPrimaryColorDark,
    scaffoldBackgroundColor: kPrimaryColorDark,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        headline6: TextStyle(
          color: kPrimaryTextColorDark,
          fontSize: 20,
        ),
      ),
    ),
    textTheme: Theme.of(context).textTheme.apply(
          bodyColor: kPrimaryTextColorDark,
          displayColor: kPrimaryTextColorDark,
        ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: kPrimaryTextColorDark,
      ),
    ),
  );
}
