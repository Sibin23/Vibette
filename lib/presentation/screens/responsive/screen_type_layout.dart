import 'package:flutter/material.dart';
import 'package:vibette/presentation/screens/responsive/responsive_builder.dart';
import 'package:vibette/presentation/screens/responsive/sizing_information.dart';

class ScreenTypeLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ScreenTypeLayout({
    super.key, // This key is for the ScreenTypeLayout itself.
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        switch (sizingInformation.deviceScreenType) {
          case DeviceScreenType.tablet:
            return tablet ?? mobile;
          case DeviceScreenType.desktop:
            return desktop ?? (tablet ?? mobile);
          default:
            return mobile;
        }
      },
    );
  }
}
