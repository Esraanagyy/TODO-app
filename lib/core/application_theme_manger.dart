import 'package:flutter/material.dart';

class ApplicationTheme {
  static const Color primaryColor = Color(0xff5D9CEC);
  static const Color primaryDarkColor = Color(0xFF040A15);

  static ThemeData  lightThemeData = ThemeData(
    scaffoldBackgroundColor: const Color(0xffDFECDB),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      toolbarHeight: 140,
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontFamily: "Poppins",
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      )
    ),
    textTheme: const TextTheme(
      titleLarge:  TextStyle(
        fontFamily: "Poppins",
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white),

      bodyLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: primaryColor),

      bodyMedium: TextStyle(
          fontFamily: "Poppins",
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: primaryColor),

      displayLarge:TextStyle(
          fontFamily: "Poppins",
          fontSize: 18,
          fontWeight: FontWeight.normal,
          color: primaryColor),

      displaySmall: TextStyle(
          fontFamily: "Poppins",
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Colors.black),

    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
         selectedItemColor: primaryColor,
          selectedIconTheme: IconThemeData(
            color: primaryColor,
            size: 35,
          ),
      showUnselectedLabels: false,
      showSelectedLabels: false,
      unselectedIconTheme: IconThemeData(
        size: 28,
      )
    ),

  );
  static ThemeData  darkThemeData = ThemeData(
    scaffoldBackgroundColor: primaryDarkColor,
    appBarTheme: const AppBarTheme(
        centerTitle: true,
        toolbarHeight: 140,
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(
          fontFamily: "Poppins",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        )
    ),
    textTheme: const TextTheme(
      titleLarge:  TextStyle(
          fontFamily: "Poppins",
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white),

      bodyLarge: TextStyle(
          fontFamily: "Poppins",
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: primaryColor),

      bodyMedium: TextStyle(
          fontFamily: "Poppins",
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: primaryColor),

      displayLarge:TextStyle(
          fontFamily: "Poppins",
          fontSize: 18,
          fontWeight: FontWeight.normal,
          color: primaryColor),

      displaySmall: TextStyle(
          fontFamily: "Poppins",
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Colors.black),

    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xff141922),
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedItemColor: primaryColor,
        selectedIconTheme: IconThemeData(
          color: primaryColor,
          size: 35,
        ),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        unselectedIconTheme: IconThemeData(
          size: 28,
        )
    ),

  );
}