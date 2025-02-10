import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vibette/application/core/constants/colors.dart';

class AppThemeButton extends StatelessWidget {
  const AppThemeButton({
    super.key,
    required this.size,
    required this.voidCallback,
    required this.buttonText,
  });
  final VoidCallback voidCallback;
  final Size size;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        voidCallback();
      },
      child: Container(
        alignment: Alignment.center,
        width: size.width,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  appThemeColor1,
                  appThemeColor2,
                  appThemeColor3,
                ])),
        child: Text(
          buttonText,
          style: GoogleFonts.roboto(
            color: white,
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
