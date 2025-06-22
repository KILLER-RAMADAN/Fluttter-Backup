import 'package:flutter/material.dart';
import 'package:testapp/core/constant/colors.dart';

ThemeData ArabicTheme = ThemeData(
    fontFamily: "Cairo",
    textTheme: TextTheme(
        headlineSmall: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 30,
      color: AppColors.black,
    )));

ThemeData EnglishTheme = ThemeData(
    fontFamily: "Lato",
    textTheme: const TextTheme(
        headlineSmall: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: AppColors.black,
        ),
        headlineLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: AppColors.black,
        ),
        bodySmall: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            height: 2,
            color: Color.fromARGB(255, 91, 90, 90))));
