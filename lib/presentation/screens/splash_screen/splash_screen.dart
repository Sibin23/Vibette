import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vibette/application/core/colors.dart';
import 'package:vibette/application/core/constants/constants.dart';
import 'package:vibette/application/core/constants/router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        GoRouter.of(context).pushReplacement(signIn);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor:
            Theme.of(context).brightness == Brightness.light ? white : black,
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Positioned(
                top: 200,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: 600,
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      h70,
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
                                      padding: const EdgeInsets.only(
                                          bottom: 3, right: 3),
                                      child: Container(
                                        height: 12,
                                        width: 12,
                                        decoration: const BoxDecoration(
                                            color: black,
                                            shape: BoxShape.circle),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                'V',
                                style: GoogleFonts.fondamento(
                                    color: white, fontSize: 100),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        'Vibette',
                        style: GoogleFonts.diphylleia(
                            color: Colors.black,
                            fontSize: 35,
                            fontWeight: FontWeight.w500),
                      ),
                      h60,
                      h70,
                      LoadingAnimationWidget.progressiveDots(
                          color: appThemePrimary, size: 70),
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: 10,
                  right: 0,
                  left: 0,
                  child: Text(
                    textAlign: TextAlign.center,
                    'Version 1.0',
                    style: TextStyle(color: grey300, fontSize: 18),
                  ))
            ],
          ),
        ));
  }
}
