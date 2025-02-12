//implement layout for mobile , tablet and desktop
//use media queries to implement responsive design

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

// Example Usage:
class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Responsive Layout")),
      body: AppLayout(
        mobileLayout: _buildMobileLayout(),
        tabletLayout: _buildTabletLayout(),
        desktopLayout: _buildDesktopLayout(),
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Center(
        child: Column(
      children: [
        const Text("Mobile Layout", style: TextStyle(fontSize: 24)),
        Image.network(
            "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png",
            height: 100)
      ],
    ));
  }

  Widget _buildTabletLayout() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text("Tablet Layout", style: TextStyle(fontSize: 30)),
          Image.network(
              "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png",
              height: 150),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Center(
      child: Column(
        children: [
          const Text("Desktop Layout", style: TextStyle(fontSize: 40)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                  "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png",
                  height: 200),
              const SizedBox(width: 20),
              Image.network(
                  "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png",
                  height: 200),
            ],
          ),
        ],
      ),
    );
  }
}
