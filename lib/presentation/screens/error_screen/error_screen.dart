import 'package:flutter/material.dart';
import 'package:vibette/application/core/constants/constants.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SafeArea(
          child: Center(
        child: Text(
          'ErrorScreen',
          style: Theme.of(context).brightness == Brightness.dark
              ? titleTextWhite
              : titleTextBlack,
        ),
      )),
    );
  }
}
