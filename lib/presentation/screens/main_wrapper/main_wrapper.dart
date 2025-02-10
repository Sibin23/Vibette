import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// Make sure this path is correct
import 'package:vibette/presentation/screens/add_post/add_post_screen.dart';
import 'package:vibette/presentation/screens/explore_screen/explore.dart';
import 'package:vibette/presentation/screens/home_screen/home_screen.dart';
import 'package:vibette/presentation/screens/messages/messages_screen.dart';
import 'package:vibette/presentation/screens/profile/profile_screen.dart';
import 'package:vibette/presentation/screens/widgets/bottom_navbar.dart';

final ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

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
    return Scaffold(
        backgroundColor: Colors.grey[200],
        extendBody: true, // Important for floating elements
        body: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (BuildContext context, int index, Widget? _) {
            return pages[index];
          },
        ),
        bottomNavigationBar: const BottomNavbarWidget());
  }
}
