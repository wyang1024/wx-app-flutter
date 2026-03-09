import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF009485);
  static const Color backgroundLight = Color(0xFFF5F8F8);
  static const Color backgroundDark = Color(0xFF0F2321);
  static const Color cardLight = Colors.white;
  static const Color cardDark = Color(0xFF1E293B); // Slate-800
  static const Color textLight = Color(0xFF0F172A); // Slate-900
  static const Color textDark = Color(0xFFF1F5F9); // Slate-100
  static const Color primaryLight = Color(0x33009485); // primary/20

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primary,
    scaffoldBackgroundColor: backgroundLight,
    useMaterial3: true,
    textTheme: const TextTheme().apply(
      bodyColor: textLight,
      displayColor: textLight,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
      primary: primary,
      background: backgroundLight,
      onBackground: textLight,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primary,
    scaffoldBackgroundColor: backgroundDark,
    useMaterial3: true,
    textTheme: const TextTheme().apply(
      bodyColor: textDark,
      displayColor: textDark,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
      brightness: Brightness.dark,
      primary: primary,
      background: backgroundDark,
      onBackground: textDark,
    ),
  );
}
