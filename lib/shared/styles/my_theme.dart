import 'package:flutter/material.dart';
import 'colors.dart';
class MyThemeData {
  static ThemeData lightTheme = ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: colorGreen,
      colorScheme: ColorScheme(
        primary: primaryColor,
        onPrimary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        surface: colorBlack,
        onSurface: colorBlack,
        background: colorGreen,
        onBackground: Colors.white,
        secondary: colorGreen,
        onSecondary: Colors.white,
        brightness: Brightness.light,
      ),
      appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: primaryColor,
          iconTheme: IconThemeData(color: Colors.white)),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: primaryColor),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.grey),
      textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold,
              color: Colors.white),
          subtitle1: TextStyle(fontSize: 25,
              color: primaryColor),
          subtitle2: TextStyle(fontSize: 25,
              color: colorGreenHeavy)));

  static ThemeData darkTheme = ThemeData(
      primaryColor: primaryDarkColor,
      scaffoldBackgroundColor: colorGreen,
      colorScheme: ColorScheme(
        primary: primaryColor,
        onPrimary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        surface: primaryColor,
        onSurface: Colors.white,
        background: colorGreen,
        onBackground: Colors.white,
        secondary: colorGreen,
        onSecondary: Colors.white,
        brightness: Brightness.light,
      ),
      appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: primaryColor,
          iconTheme: IconThemeData(color: Colors.white)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.grey),
      textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          subtitle1: TextStyle(fontSize: 25, color: primaryColor)));
}
