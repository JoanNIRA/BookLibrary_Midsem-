import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.teal,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.teal,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.teal,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.teal[800],
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    ),
  );
}