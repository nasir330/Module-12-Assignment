import 'package:flutter/material.dart';

class AppTheme {
  /// Light Theme Data
  static final ThemeData lightTheme = ThemeData(
    primaryColor: Colors.indigo,
    primarySwatch: Colors.indigo,
    colorScheme: ColorScheme.light(
      primary: Colors.indigo,
      secondary: Colors.black, // operator color
    ),

    /// AppBar Theme
    appBarTheme: AppBarThemeData(
      backgroundColor: Colors.indigo,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
    ),

    ///Icon Button
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStateProperty.all(Colors.white),
        iconSize: WidgetStateProperty.all(26),
        backgroundColor: WidgetStateProperty.all(Colors.grey[300]),
        foregroundColor: WidgetStateProperty.all(Colors.white),
      ),
    ),

    ///Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(25),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        side: const BorderSide(color: Colors.black26, width: 1),
      ),
    ),
  );

  /// Dark Theme Data
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: Colors.indigo,
      secondary: Colors.orange, // operator color
    ),

    /// AppBar Theme
    appBarTheme: AppBarThemeData(
      backgroundColor: Colors.black54,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
    ),

    ///Icon Button
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStateProperty.all(Colors.white),
        iconSize: WidgetStateProperty.all(26),
        backgroundColor: WidgetStateProperty.all(Colors.grey[900]),
        foregroundColor: WidgetStateProperty.all(Colors.white),
      ),
    ),

    ///Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(25),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.black,
        side: const BorderSide(color: Colors.white24, width: 1),
      ),
    ),
  );
}
