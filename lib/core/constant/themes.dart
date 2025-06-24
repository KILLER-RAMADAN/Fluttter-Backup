import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData(
    fontFamily: "Noon",
    textTheme: TextTheme(
        bodyLarge: TextStyle(),
        bodyMedium: TextStyle(),
        titleLarge: TextStyle(),
        headlineSmall: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 25,
        )),
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primarySwatch: Colors.blue,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.grey),
      backgroundColor: Colors.white,
      foregroundColor: Colors.white,
    ),
  );

  static final dark = ThemeData(
    fontFamily: "Noon",
    textTheme: TextTheme(
        bodyLarge: TextStyle(),
        bodyMedium: TextStyle(),
        titleLarge: TextStyle(),
        headlineSmall: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 25,
        )),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    primarySwatch: Colors.deepPurple,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.grey),
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    ),
  );
}
