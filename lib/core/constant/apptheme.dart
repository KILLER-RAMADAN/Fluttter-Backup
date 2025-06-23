import 'package:flutter/material.dart';


ThemeData ArabicTheme = ThemeData(
    fontFamily: "Cairo",
    textTheme: TextTheme(
        headlineSmall: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 30,
      color: Colors.black,
    )));

ThemeData EnglishTheme = ThemeData(
    fontFamily: "Lato",
    textTheme: const TextTheme(
        headlineSmall: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 25,
      color: Colors.black,
    )));
