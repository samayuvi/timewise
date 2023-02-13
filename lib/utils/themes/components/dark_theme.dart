import 'package:flutter/material.dart';



class DarkTheme {

  static ThemeData theme = ThemeData(
    primaryColor: const Color.fromRGBO(26, 26, 26, 1),
    scaffoldBackgroundColor: const Color.fromRGBO(26, 26, 26, 1),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    cardTheme: const CardTheme(
      color: Color.fromRGBO(193, 193, 193, 0.30196078431372547),
      elevation: 0,
    ),
    appBarTheme: const AppBarTheme(
      toolbarHeight: kToolbarHeight + 1.25,
      titleTextStyle: TextStyle(
        fontFamily: 'Inter',
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Color.fromRGBO(26, 26, 21,0.2 ),
      elevation: 0,),
    fontFamily: 'Inter',
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: Colors.white,
        fontSize: 36.0,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.0,
        color: Colors.white,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600
      ),
      bodyMedium: TextStyle(
        fontSize: 14.0,
        color: Colors.white,
        fontFamily: 'Inter',
      ),
    ),

    colorScheme: ColorScheme.fromSwatch()
        .copyWith(primary:Colors.blue, secondary: Colors.white, background: const Color.fromRGBO(51, 51, 51, 1)),
  );



}
