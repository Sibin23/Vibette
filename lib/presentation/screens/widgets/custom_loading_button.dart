import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vibette/application/core/constants/colors.dart';

class CustomLoadingButton extends StatelessWidget {
  final Size size;
  const CustomLoadingButton({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      alignment: Alignment.center,
      child: Container(
        height: 52,
        width: size.width * 0.2,
        decoration: BoxDecoration(
          border: Border.all(
              color: Theme.of(context).brightness == Brightness.dark
                  ? white
                  : black),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: LoadingAnimationWidget.staggeredDotsWave(
              color: appThemeColor2, size: 50),
        ),
      ),
    );
  }
}
