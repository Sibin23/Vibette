import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vibette/core/constants/colors.dart';
import 'package:vibette/core/constants/constants.dart';
import 'package:vibette/presentation/screens/home_screen/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromRGBO(159, 2, 94, 1),
                      Color.fromRGBO(249, 200, 41, 1)
                    ])),
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
                        height: 25, // Keep the height as desired
                        width:
                            30, // Double the width for a wider oval (adjust as needed)
                        decoration: const BoxDecoration(
                          color: whiteColor,
                        ), // Remove BoxShape.circle!
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 3,right: 3),
                          child: Container(
                            height: 12,
                            width: 12,
                            decoration: const BoxDecoration(
                                color: blackColor, shape: BoxShape.circle),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'V',
                    style: GoogleFonts.fondamento(
                        color: whiteColor, fontSize: 100),
                  ),
                ],
              ),
            ),
          ),
         
          Text(
            'Vibette',
            style: GoogleFonts.diphylleia(color: Colors.black, fontSize: 30),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            child: Text('Get Started'),
          ),
        ],
      ),
    ));
  }
}
