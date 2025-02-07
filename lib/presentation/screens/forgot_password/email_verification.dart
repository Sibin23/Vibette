import 'package:flutter/material.dart';

class GetOTPScreen extends StatelessWidget {
  const GetOTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(children: [
        Text('OTP Verification'),
      ])),
    );
  }
}
