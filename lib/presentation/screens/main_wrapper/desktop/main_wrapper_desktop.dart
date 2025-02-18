import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sidebar_with_animation/animated_side_bar.dart';
import 'package:vibette/presentation/screens/add_post/add_post_screen.dart';
import 'package:vibette/presentation/screens/explore_screen/explore.dart';
import 'package:vibette/presentation/screens/home_screen/desktop/home_screen_desktop.dart';
import 'package:vibette/presentation/screens/messages/messages_screen.dart';
import 'package:vibette/presentation/screens/profile/profile_screen.dart';
final ValueNotifier<int> slidebarIndex = ValueNotifier(0);
class MainWrapperDesktop extends StatefulWidget {
  const MainWrapperDesktop({super.key, required this.size});
  final Size size;

  @override
  State<MainWrapperDesktop> createState() => _MainWrapperDesktopState();
}

class _MainWrapperDesktopState extends State<MainWrapperDesktop> {
  int selectedIndex = 0;
  final List<Widget> pages = [
    const HomeScreenDesktop(), // Replace with your actual home screen widget
    const ExploreScreen(), // Replace with your explore screen
    const AddPostScreen(), // Replace with your add post screen
    const MessagesScreen(), // Replace with your chat screen
    const ProfileScreen(), // Replace with your profile screen
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ValueListenableBuilder(
          valueListenable: slidebarIndex,
          builder: (BuildContext context, int index, Widget? _) {
          return SafeArea(
              child: Row(
            children: [
              SideBarAnimated(
                
                mainLogoImage: 'assets/google_logo.webp',
                onTap: (selectedIndex) {
                  slidebarIndex.value = selectedIndex;
                },
                widthSwitch: 700,
                sidebarItems: [
                  SideBarItem(
                    iconSelected: Icons.home_rounded,
                    iconUnselected: Icons.home_outlined,
                    text: 'Home',
                  ),
                  SideBarItem(
                    iconSelected: CupertinoIcons.search,
                    iconUnselected: CupertinoIcons.search,
                    text: 'Eplore',
                  ),
                  SideBarItem(
                    iconSelected: CupertinoIcons.add_circled_solid,
                    iconUnselected: CupertinoIcons.add_circled,
                    text: 'Add Post',
                  ),
                  SideBarItem(
                    iconSelected: CupertinoIcons.chat_bubble_text_fill,
                    iconUnselected: CupertinoIcons.chat_bubble_text,
                    text: 'Chat',
                  ),
                  SideBarItem(
                    iconSelected: CupertinoIcons.person_fill,
                    iconUnselected: CupertinoIcons.person_fill,
                    text: 'Profile',
                  ),
                ],
              ),
              Expanded(
                child: SizedBox(
                 
                  width: widget.size.width,
                  child: pages[index],
                ),
              ),
              Container(
                width: widget.size.width * .24,
              )
            ],
          ));
        }
      ),
    );
  }
}
