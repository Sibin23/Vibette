import 'package:flutter/material.dart';
import 'package:vibette/presentation/screens/add_post/add_post_screen.dart';
import 'package:vibette/presentation/screens/explore_screen/explore.dart';
import 'package:vibette/presentation/screens/home_screen/home_screen.dart';
import 'package:vibette/presentation/screens/main_wrapper/desktop/main_wrapper_desktop.dart';
import 'package:vibette/presentation/screens/main_wrapper/mobile/main_wrapper_mobile.dart';
import 'package:vibette/presentation/screens/main_wrapper/tablet/main_wrapper_tablet.dart';
import 'package:vibette/presentation/screens/messages/messages_screen.dart';
import 'package:vibette/presentation/screens/profile/profile_screen.dart';
import 'package:vibette/presentation/screens/widgets/app_layout.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  final pages = [
    const HomeScreen(),
    const ExploreScreen(),
    const AddPostScreen(),
    const MessagesScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final size =  MediaQuery.of(context).size;
    return Scaffold(
      body: AppLayout(
          mobileLayout: const MainWrapperMobile(),
          tabletLayout: const MainWrapperTablet(),
          desktopLayout: MainWrapperDesktop(size: size)),
    );
  }
}
