import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF4CAF50);
  static const Color secondaryColor = Color(0xFFFF9800);
  
  // Light theme colors
  static const Color lightBackground = Color(0xFFF5F5F5);
  static const Color lightCard = Colors.white;
  static const Color lightText = Color(0xFF212121);
  static const Color lightSecondaryText = Color(0xFF757575);
  
  // Dark theme colors
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkCard = Color(0xFF1E1E1E);
  static const Color darkText = Colors.white;
  static const Color darkSecondaryText = Color(0xFFB0B0B0);
  
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: lightBackground,
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      foregroundColor: lightText,
    ),
    cardTheme: CardTheme(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: lightCard,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: lightText,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: lightText,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: lightText,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: lightSecondaryText,
      ),
    ),
  );
  
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: darkBackground,
    colorScheme: const ColorScheme.dark(
      primary: primaryColor,
      secondary: secondaryColor,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      foregroundColor: darkText,
    ),
    cardTheme: CardTheme(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: darkCard,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: darkText,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: darkText,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: darkText,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: darkSecondaryText,
      ),
    ),
  );
}
