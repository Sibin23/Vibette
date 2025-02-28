import 'package:flutter/material.dart';
import 'package:vibette/presentation/screens/add_post/add_post_screen.dart';
import 'package:vibette/presentation/screens/explore_screen/explore.dart';
import 'package:vibette/presentation/screens/home_screen/home_screen.dart';
import 'package:vibette/presentation/screens/main_wrapper/mobile/main_wrapper_mobile.dart';
import 'package:vibette/presentation/screens/messages/messages_screen.dart';
import 'package:vibette/presentation/screens/profile/profile_screen.dart';
import 'package:vibette/presentation/screens/widgets/bottom_navbar.dart';

class MainWrapperTablet extends StatefulWidget {
  const MainWrapperTablet({super.key});

  @override
  State<MainWrapperTablet> createState() => _MainWrapperTabletState();
}

class _MainWrapperTabletState extends State<MainWrapperTablet> {
  final pages = [
    const HomeScreen(),
    const ExploreScreen(),
    const AddPostScreen(),
    const MessagesScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (BuildContext context, int index, Widget? _) {
            return pages[index];
          },
        ),
        bottomNavigationBar: const BottomNavbarWidget());
  }
}
