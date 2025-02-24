import 'package:flutter/material.dart';

class CustomSnackBar {
  static void show(BuildContext context, String message, Color color,
      {Duration duration = const Duration(seconds: 2),
      VoidCallback? onPressed}) {
    // Get the OverlayState correctly:
    OverlayState? overlayState = Overlay.of(context);

    // Check if overlayState is not null
    ScaffoldMessenger.of(context)
        .showSnackBar(
          SnackBar(
            content: Text(message),
            duration: duration,
            backgroundColor: color,
            behavior: SnackBarBehavior.floating,
            animation: CurvedAnimation(
              parent: AnimationController(vsync: overlayState),
              curve: Curves.easeInOut,
            ),
          ),
        )
        .closed
        .then((reason) {
      if (onPressed != null) {
        onPressed();
      }
    });
  }

  static void showError(BuildContext context, String errorMessage, Color color,
      {Duration duration = const Duration(seconds: 3)}) {
    show(context, errorMessage, color, duration: duration);
  }
}
