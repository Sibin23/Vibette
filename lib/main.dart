import 'package:flutter/material.dart';
import 'package:vibette/core/colors.dart';
import 'package:vibette/presentation/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      title: 'Vibette',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: white,
        appBarTheme: const AppBarTheme(
          color: white,
          iconTheme: IconThemeData(
            color: black,
          ),
          surfaceTintColor: white,
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 20, color: black),
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      home: const SplashScreen(),
    );
  }
}
