import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// Make sure this path is correct
import 'package:vibette/presentation/screens/add_post/add_post_screen.dart';
import 'package:vibette/presentation/screens/explore_screen/explore.dart';
import 'package:vibette/presentation/screens/home_screen/home_screen.dart';
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
    const ProfileScreen(),
  ];

  bool _showBottomNavBar = true; // Use a regular bool for simplicity

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      extendBody: true, // Important for floating elements
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          final ScrollDirection direction = notification.direction;
          setState(() {
            if (direction == ScrollDirection.reverse) {
              _showBottomNavBar = false;
            } else if (direction == ScrollDirection.forward) {
              _showBottomNavBar = true;
            }
            // Add this to handle the case where the scroll stops and might be at the top.
            else if (direction == ScrollDirection.idle && notification.metrics.atEdge && notification.metrics.pixels == 0) {
              _showBottomNavBar = true;
            }
          });
          return true;
        },
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (BuildContext context, int index, Widget? _) {
            return pages[index];
          },
        ),
      ),
      bottomNavigationBar: _showBottomNavBar
          ? const BottomNavbarWidget()
          : null, // Use null to hide the bar completely
    );
  }
}