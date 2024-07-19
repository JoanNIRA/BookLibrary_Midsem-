import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: Colors.white,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: Colors.white,
      secondary: Colors.teal,
    ),
  );

  static final darkTheme = ThemeData(
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: Colors.black,
      secondary: Colors.teal,
    ),
  );
}
