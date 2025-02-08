import 'package:flutter/material.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import 'package:vibette/application/core/constants/colors.dart';
import 'package:vibette/presentation/screens/main_wrapper/main_wrapper.dart';

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
          child: SlidingClippedNavBar(
              backgroundColor: appTheme(context),
              barItems: [
                BarItem(title: 'Home', icon: Icons.home),
                BarItem(title: 'Explore', icon: Icons.grid_view_rounded),
                BarItem(title: 'Add Post', icon: Icons.add),
                BarItem(title: 'Profile', icon: Icons.person),
              ],
              selectedIndex: indexChangeNotifier.value,
              onButtonPressed: (value) {
                indexChangeNotifier.value = value;
              },
              inactiveColor: grey,
              activeColor: Theme.of(context).brightness == Brightness.dark
                  ? white
                  : black),
        );
      },
      valueListenable: indexChangeNotifier,
    );
  }
}
