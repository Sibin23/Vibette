import 'package:flutter/material.dart';
import 'package:vibette/application/core/constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme(context),
      body: SafeArea(
          child: ListView(children: const [
        Text('ProfileScreen'),
      ])),
    );
  }
}
