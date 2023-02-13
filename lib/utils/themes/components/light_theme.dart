import 'package:flutter/material.dart';

class LightTheme {
  static ThemeData theme = ThemeData(
    primaryColor: const Color.fromRGBO(255,255,255,1),
    scaffoldBackgroundColor: const Color.fromRGBO(255,255,255,1),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),
    cardTheme: const CardTheme(
      color: Color.fromRGBO(193, 193, 193, 0.4),
      elevation: 0,
    ),
    appBarTheme: const AppBarTheme(
      toolbarHeight: kToolbarHeight + 1.25,
      titleTextStyle: TextStyle(
        fontFamily: 'Inter',
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      elevation: 0,),
    fontFamily: 'Inter',
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: Colors.black,
        fontSize: 36.0,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
          fontSize: 16.0,
          color: Colors.black,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600
      ),
      bodyMedium: TextStyle(
        fontSize: 14.0,
        color: Colors.black,
        fontFamily: 'Inter',
      ),
    ),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(primary:Colors.blue, secondary: Colors.white, background: Colors.grey[200]),
  );
}