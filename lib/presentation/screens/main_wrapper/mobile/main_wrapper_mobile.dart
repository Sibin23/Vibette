import 'package:flutter/material.dart';
import 'package:vibette/presentation/screens/add_post/add_post_screen.dart';
import 'package:vibette/presentation/screens/explore_screen/explore.dart';
import 'package:vibette/presentation/screens/home_screen/home_screen.dart';
import 'package:vibette/presentation/screens/messages/messages_screen.dart';
import 'package:vibette/presentation/screens/profile/profile_screen.dart';
import 'package:vibette/presentation/screens/widgets/bottom_navbar.dart';

final ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class MainWrapperMobile extends StatefulWidget {
  const MainWrapperMobile({super.key});

  @override
  State<MainWrapperMobile> createState() => _MainWrapperMobileState();
}

class _MainWrapperMobileState extends State<MainWrapperMobile> {
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
