import 'package:flutter/material.dart';
import 'package:vibette/application/core/constants/constants.dart';

class EmailVerificationSection1 extends StatelessWidget {
  const EmailVerificationSection1(
      {super.key,
      required this.size,
      required this.email,
      required this.theme});
  final Size size;
  final String email;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      h30,
      Container(
          alignment: Alignment.center,
          width: size.width,
          height: 200,
          child: Image.asset(
            'assets/otpsent.webp',
            fit: BoxFit.cover,
          )),
      h20,
      Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Text(
          'Verification Code',
          style: theme.textTheme.titleLarge,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
                'Please enter the 4 digit code that send to your email $email',
                style: theme.textTheme.bodyLarge),
          ],
        ),
      ),
    ]);
  }
}
