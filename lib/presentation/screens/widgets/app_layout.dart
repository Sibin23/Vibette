

import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {
  final Widget mobileLayout;
  final Widget tabletLayout;
  final Widget desktopLayout;

  const AppLayout({
    super.key,
    required this.mobileLayout,
    required this.tabletLayout,
    required this.desktopLayout,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 600) {
          // Mobile layout
          return mobileLayout;
        } else if (constraints.maxWidth < 1024) {
          // Tablet layout
          return tabletLayout;
        } else {
          // Desktop layout
          return desktopLayout;
        }
      },
    );
  }
}


