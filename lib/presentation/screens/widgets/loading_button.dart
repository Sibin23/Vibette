import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vibette/application/core/constants/colors.dart';

class LoadingButton extends StatelessWidget {
  final Size size;
  const LoadingButton({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: LoadingAnimationWidget.staggeredDotsWave(color: white, size: 50),
    );
  }
}
