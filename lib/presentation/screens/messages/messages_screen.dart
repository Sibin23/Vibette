import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: ListView(
        children: const [
          Text('Messages')
        ],
      ),
    );
  }
}