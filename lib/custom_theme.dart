import 'package:flutter/material.dart';

class CustomTheme {
  final ThemeData data;
  const CustomTheme({required this.data});

  static CustomTheme of(BuildContext context) {
    return CustomTheme(data: Theme.of(context));
  }

  static final ThemeData themeData = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      scaffoldBackgroundColor: Colors.grey,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal),
        displayMedium: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal),
        displaySmall: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal),
        bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal),
        bodyMedium: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal),
        bodySmall: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal),
      ));
}
