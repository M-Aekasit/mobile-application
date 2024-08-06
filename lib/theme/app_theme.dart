import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData themeData = ThemeData(
    primaryColor: const Color(0xFF2A2C2D),
    scaffoldBackgroundColor: const Color(0xFF1D1D1D),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF2A2C2D),
      centerTitle: true,
      titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto'),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF2A2C2D),
      selectedItemColor: Colors.white,
      unselectedItemColor: Color(0xFF2A2C2D),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
    ),
  );
}
