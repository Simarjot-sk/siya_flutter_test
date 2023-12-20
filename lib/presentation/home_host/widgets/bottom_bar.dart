import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onItemSelected;
  const BottomBar({super.key, required this.currentIndex, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return BottomNavyBar(
      selectedIndex: currentIndex,
      onItemSelected: onItemSelected,
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
            title: const Text('Home'),
            icon: const Icon(Icons.home)
        ),
        BottomNavyBarItem(
            title: const Text('Discover'),
            icon: const Icon(Icons.travel_explore)
        ),
        BottomNavyBarItem(
            title: const Text('Saved'),
            icon: const Icon(Icons.save)
        ),
        BottomNavyBarItem(
            title: const Text('Profile'),
            icon: const Icon(Icons.person_3_rounded)
        ),
      ],
    );
  }
}
