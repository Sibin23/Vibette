import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vibette/core/colors.dart';
import 'package:vibette/core/constants/constants.dart';
import 'package:vibette/presentation/screens/login_screen/widgets/textformfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final email = TextEditingController();
    return Scaffold(
      backgroundColor:
          Theme.of(context).brightness == Brightness.light ? white : black,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: grey300,
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromRGBO(159, 2, 94, 1),
                      Color.fromRGBO(249, 200, 41, 1)
                    ]),
              ),
              child: Center(
                child: Stack(
                  children: [
                    Positioned(
                      top: 5,
                      left: 20,
                      child: ClipOval(
                        clipBehavior: Clip.hardEdge,
                        child: Container(
                          alignment: Alignment.bottomRight,
                          height: 25,
                          width: 30,
                          decoration: const BoxDecoration(
                            color: white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 3, right: 3),
                            child: Container(
                              height: 12,
                              width: 12,
                              decoration: const BoxDecoration(
                                  color: black, shape: BoxShape.circle),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'V',
                      style:
                          GoogleFonts.fondamento(color: white, fontSize: 100),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              'Vibette',
              style: GoogleFonts.diphylleia(
                  color: Theme.of(context).brightness == Brightness.light
                      ? black
                      : white,
                  fontSize: 35,
                  fontWeight: FontWeight.w500),
            ),
            h30,
            TextFormFieldAuth(
              controller: email,
              hintText: 'Email',
            ),
            h10,
            TextFormFieldAuth(
              controller: email,
              hintText: 'Email',
            ),
            h10,
            TextFormFieldAuth(
              controller: email,
              hintText: 'Email',
            )
          ],
        ),
      )),
    );
  }
}
