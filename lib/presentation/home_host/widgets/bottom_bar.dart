import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:simar_test/presentation/colors.dart';

class BottomBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onItemSelected;

  const BottomBar(
      {super.key, required this.currentIndex, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
        color: Colors.white, fontWeight: FontWeight.w600, fontSize: 12);
    return SalomonBottomBar(
      currentIndex: currentIndex,
      onTap: onItemSelected,
      selectedItemColor: kBlue,
      selectedColorOpacity: 1,
      unselectedItemColor: Colors.grey,
      items: [
        SalomonBottomBarItem(
          icon: const Icon(Icons.home),
          activeIcon: const Icon(
            Icons.home,
            color: Colors.white,
          ),
          title: const Text("Home", style: textStyle),
          selectedColor: kBlue,
        ),
        SalomonBottomBarItem(
          icon: const Icon(Icons.travel_explore),
          activeIcon: const Icon(
            Icons.travel_explore,
            color: Colors.white,
          ),
          title: const Text("Discover", style: textStyle,),
        ),
        SalomonBottomBarItem(
          icon: const Icon(Icons.save),
          activeIcon: const Icon(
            Icons.save,
            color: Colors.white,
          ),
          title: const Text("Saved", style: textStyle,),
        ),
        SalomonBottomBarItem(
          icon: const Icon(Icons.person_3_rounded),
          activeIcon: const Icon(
            Icons.person_3_rounded,
            color: Colors.white,
          ),
          title: const Text("Profile", style: textStyle,),
        ),
      ],
    );
  }
}
