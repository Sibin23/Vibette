import 'package:flutter/material.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SafeArea(
          child: ListView(children: const [
                Text('AddPostScreen'),
              ])),
    );
  }
}
