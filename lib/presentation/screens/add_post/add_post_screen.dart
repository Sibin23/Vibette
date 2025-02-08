import 'package:flutter/material.dart';
import 'package:vibette/application/core/constants/colors.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme(context),
      body: SafeArea(
          child: ListView(children: const [
                Text('AddPostScreen'),
              ])),
    );
  }
}
