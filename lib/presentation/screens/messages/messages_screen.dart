import 'package:flutter/material.dart';
import 'package:vibette/application/core/constants/colors.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme(context),
      body: ListView(
        children: [
          Text('Messages')
        ],
      ),
    );
  }
}