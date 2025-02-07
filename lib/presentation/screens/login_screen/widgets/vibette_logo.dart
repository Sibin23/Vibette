import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vibette/application/core/colors.dart';

class VibetteLogo extends StatelessWidget {
  const VibetteLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          color: grey300,
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: [
                appThemePrimary,
                appThemeSecondary,
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
                style: GoogleFonts.fondamento(color: white, fontSize: 100),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
