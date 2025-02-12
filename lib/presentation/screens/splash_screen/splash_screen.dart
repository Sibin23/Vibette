import 'package:flutter/material.dart';
import 'package:vibette/presentation/screens/splash_screen/desktop/splash_screen_desktop.dart';
import 'package:vibette/presentation/screens/splash_screen/mobile/splash_screen_mobile.dart';
import 'package:vibette/presentation/screens/splash_screen/tablet/splash_screen_tablet.dart';
import 'package:vibette/presentation/screens/widgets/app_layout.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: AppLayout(
          mobileLayout: SplashScreenMobile(size: size),
          tabletLayout: SplashScreenTablet(size: size),
          desktopLayout: SplashScreenDesktop(size: size)),
    );
  }
}
