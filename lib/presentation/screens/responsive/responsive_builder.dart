import 'package:flutter/material.dart';
import 'package:vibette/presentation/screens/responsive/sizing_information.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    SizingInformation sizingInformation,
  ) builder;

  const ResponsiveBuilder({super.key, required this.builder});

  static DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
    double devicePixelRatio = mediaQuery.devicePixelRatio;
    double screenWidth = mediaQuery.size.width;

    if (devicePixelRatio > 2 && screenWidth > 768) {
      // Adjust these breakpoints as needed
      return DeviceScreenType.desktop;
    }

    if (screenWidth > 600) {
      // Adjust breakpoint
      return DeviceScreenType.tablet;
    }
    return DeviceScreenType.mobile;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, boxConstraints) {
      var mediaQuery = MediaQuery.of(context);
      var sizingInformation = SizingInformation(
        deviceScreenType: ResponsiveBuilder.getDeviceType(mediaQuery),
        screenSize: mediaQuery.size,
        localWidgetSize:
            Size(boxConstraints.maxWidth, boxConstraints.maxHeight),
      );
      return builder(context, sizingInformation);
    });
  }
}
