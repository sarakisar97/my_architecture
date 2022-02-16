import 'package:flutter/material.dart';

abstract class AppTheme{
  static ThemeData lightTheme = ThemeData(
      primarySwatch: Colors.blue,
      appBarTheme: _appBarTheme,
  );

  static AppBarTheme get _appBarTheme => const AppBarTheme(elevation: 0.0);
}