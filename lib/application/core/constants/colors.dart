// Colors

import 'package:flutter/material.dart';

// const appThemeColor2 = Color.fromRGBO(159, 2, 94, 1);
// const appThemeColor3 = Color.fromRGBO(249, 200, 41, 1);
const appThemeColor1 = Color.fromRGBO(248, 102, 149, 1);
const appThemeColor2 = Color.fromRGBO(255, 82, 105, 1);
const appThemeColor3 = Color.fromRGBO(108, 105, 242, 1);
const textfieldWhite = Color.fromRGBO(243, 243, 243, 1);
final textfieldBlack = Colors.grey.shade900;
const white = Colors.white;
const black = Colors.black;
const red = Colors.red;
final grey300 = Colors.grey.shade300;
const lightgreyauth = Color.fromARGB(255, 238, 237, 237);
const darkgreymain = Color.fromARGB(255, 21, 21, 22);
final darkbg = Colors.grey.shade900;
const grey = Colors.grey;
const lightgrey = Color.fromARGB(255, 210, 210, 210);

textfieldTheme(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark
      ? textfieldBlack
      : textfieldWhite;
}

textfieldTextTheme(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark ? grey300 : grey;
}

appTheme(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark ? black : white;
}
