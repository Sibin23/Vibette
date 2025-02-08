import 'package:flutter/material.dart';
import 'package:vibette/application/core/constants/colors.dart';
import 'package:vibette/presentation/screens/sign_in/widgets/vibette_logo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme(context),
      body: SafeArea(
        child: ListView(
          children: const [
            VibetteLogo(),
            Text('Home Screen'),
            ],
        ),
      ),
    );
  }
}
