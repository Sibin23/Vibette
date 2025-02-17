import 'package:flutter/material.dart';

  final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    hintColor: const Color(0xffD83F89),
    appBarTheme: const AppBarTheme(elevation: 0.0),
    scaffoldBackgroundColor: const Color(0xff080F5B),
    primaryColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xff022140)),
  );

  final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      elevation: 0,
    ),
    scaffoldBackgroundColor: const Color(0xff78ab8a),
    primaryColor: const Color(0xfffffffF), // Consider using Colors.white here
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xff06d755)).copyWith(background: const Color(0xff78ab8a)),
  );