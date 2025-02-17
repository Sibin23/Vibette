import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vibette/application/core/constants/colors.dart';
import 'package:vibette/presentation/screens/main_wrapper/mobile/main_wrapper_mobile.dart';

class BottomNavbarWidget extends StatelessWidget {
  const BottomNavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (BuildContext context, int newIndex, _) {
        return DecoratedBox(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 2,
              )
            ]),
            child: FlashyTabBar(
              backgroundColor: appTheme(context),
              items: [
                FlashyTabBarItem(
                    inactiveColor: grey,
                    activeColor: Theme.of(context).brightness == Brightness.dark
                        ? white
                        : black,
                    title: const Text('Home'),
                    icon: const Icon(
                      CupertinoIcons.home,
                      size: 25,
                    )),
                FlashyTabBarItem(
                    activeColor: Theme.of(context).brightness == Brightness.dark
                        ? white
                        : black,
                    inactiveColor: grey,
                    title: const Text('Explore'),
                    icon: const Icon(
                      CupertinoIcons.search,
                      size: 25,
                    )),
                FlashyTabBarItem(
                    activeColor: Theme.of(context).brightness == Brightness.dark
                        ? white
                        : black,
                    inactiveColor: grey,
                    title: const Text('Add Post'),
                    icon: const Icon(
                      CupertinoIcons.add_circled,
                      size: 25,
                    )),
                FlashyTabBarItem(
                    activeColor: Theme.of(context).brightness == Brightness.dark
                        ? white
                        : black,
                    inactiveColor: grey,
                    title: const Text('Chat'),
                    icon: const Icon(
                      CupertinoIcons.chat_bubble_text,
                      size: 25,
                    )),
                FlashyTabBarItem(
                    activeColor: Theme.of(context).brightness == Brightness.dark
                        ? white
                        : black,
                    inactiveColor: grey,
                    title: const Text('Profile'),
                    icon: const Icon(
                      CupertinoIcons.person_fill,
                      size: 25,
                    )),
              ],

              selectedIndex: indexChangeNotifier.value,
              onItemSelected: (value) {
                indexChangeNotifier.value = value;
              },

              // inactiveColor: grey,
            ));
      },
      valueListenable: indexChangeNotifier,
    );
  }
}
