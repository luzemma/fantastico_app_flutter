import 'package:fantastico_app/utils/color_helper.dart';
import 'package:flutter/material.dart';

enum AppTheme {
  light,
  dark,
}

final appThemeData = {
  AppTheme.light: ThemeData(
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      color: ColorHelper.primaryBlue,
      titleTextStyle: const TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
        fontSize: 22,
      ),
      centerTitle: true,
    ),
    iconTheme: IconThemeData(
      color: ColorHelper.primaryBlue,
    ),
    textTheme: ThemeData.light().textTheme.copyWith(
          displayLarge: const TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          displayMedium: const TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          displaySmall: const TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
          headlineLarge: const TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          headlineMedium: const TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          headlineSmall: const TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
          titleLarge: const TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          titleMedium: const TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          titleSmall: const TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
          labelLarge: const TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          labelMedium: const TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          labelSmall: const TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
          bodyLarge: const TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          bodyMedium: const TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          bodySmall: const TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
  ),
};
