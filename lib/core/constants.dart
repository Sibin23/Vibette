// height
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vibette/core/colors.dart';

const h10 = SizedBox(height: 10);
const h20 = SizedBox(height: 20);
const h30 = SizedBox(height: 30);
const h40 = SizedBox(height: 40);
const h50 = SizedBox(height: 50);
const h60 = SizedBox(height: 60);
const h70 = SizedBox(height: 70);

// width
const w10 = SizedBox(width: 10);
const w20 = SizedBox(width: 20);
const w30 = SizedBox(width: 30);
const w40 = SizedBox(width: 40);
const w50 = SizedBox(width: 50);
const w60 = SizedBox(width: 60);

// Text Style
final logoText = GoogleFonts.fondamento(color: white);

// BoxShadow
final boxShadowWhite = [
  BoxShadow(
    color: grey300,
    offset: const Offset(5, 5),
    blurRadius: 15,
    spreadRadius: 1,
  ),
  const BoxShadow(
    color: white,
    offset: Offset(-5, -5),
    blurRadius: 15,
    spreadRadius: 1,
  )
];