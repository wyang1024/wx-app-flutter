import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primary = Color(0xFF009485);
  static const Color brandGreen = Color(0xFF52C41A);
  static const Color brandBlue = Color(0xFF1890FF);
  static const Color brandOrange = Color(0xFFFAAD14);
  static const Color brandRed = Color(0xFFFF4D4F);
  static const Color bgGray = Color(0xFFF7F8FA);

  static const Color backgroundLight = Color(0xFFF5F8F8);
  static const Color backgroundDark = Color(0xFF0F2321);
  static const Color cardLight = Colors.white;
  static const Color cardDark = Color(0xFF1E293B); // Slate-800
  static const Color textLight = Color(0xFF0F172A); // Slate-900
  static const Color textDark = Color(0xFFF1F5F9); // Slate-100
  static const Color primaryLight = Color(0x33009485); // primary/20

  static ThemeData get lightTheme => ThemeData(
    brightness: Brightness.light,
    primaryColor: primary,
    scaffoldBackgroundColor: backgroundLight,
    useMaterial3: true,
    textTheme: GoogleFonts.manropeTextTheme().apply(
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

  static ThemeData get darkTheme => ThemeData(
    brightness: Brightness.dark,
    primaryColor: primary,
    scaffoldBackgroundColor: backgroundDark,
    useMaterial3: true,
    textTheme: GoogleFonts.manropeTextTheme().apply(
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
