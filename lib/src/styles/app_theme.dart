import 'package:flutter/material.dart';

class AppTheme {
  static const Color spaceBlack = Color(0xFF0A0A0A);
  static const Color starBlue = Color(0xFF1E4D8C);
  static const Color techSilver = Color(0xFFE5E5E5);
  
  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: spaceBlack,
      colorScheme: const ColorScheme.dark().copyWith(
        primary: starBlue,
        secondary: techSilver,
        surface: spaceBlack,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: techSilver),
        displayMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: techSilver),
        bodyLarge: TextStyle(fontSize: 16, color: techSilver),
        bodyMedium: TextStyle(fontSize: 14, color: techSilver),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}