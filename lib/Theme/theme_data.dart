import 'package:flutter/material.dart';

import '../utils/app_utils.dart';




final ThemeData myTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: "Montserrat",
  primaryColor: AppColor.white,
  secondaryHeaderColor: AppColor.menuTab,
  navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColor.navigationBarColor
  ),
  // Define the text theme
  textTheme: const TextTheme(
    titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontFamily: "Montserrat",
        letterSpacing: 1.5,
        color: AppColor.ctaButtoncolor),
    titleMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontFamily: "Montserrat",
        letterSpacing: 1.5,
        color: AppColor.ctaButtoncolor),
    displayLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      fontFamily: "Montserrat",color: AppColor.black
    ),
    displayMedium: TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "Montserrat",color: AppColor.black),
    displaySmall: TextStyle(
        fontSize: 16, fontWeight: FontWeight.bold, fontFamily: "Montserrat",color: AppColor.black),
    bodyLarge: TextStyle(
        fontSize: 14, fontWeight: FontWeight.bold, fontFamily: "Montserrat",color: AppColor.black),
    bodyMedium: TextStyle(
        fontSize: 12, fontWeight: FontWeight.normal, fontFamily: "Montserrat",color: AppColor.black),
    bodySmall: TextStyle(
        fontSize: 10, fontWeight: FontWeight.normal, fontFamily: "Montserrat",color: AppColor.black),
  ),
);
