import 'package:flutter/material.dart';
import 'package:simar_test/presentation/discover/discover_screen.dart';
import 'package:simar_test/presentation/home/home_screen.dart';
import 'package:simar_test/presentation/home_host/widgets/bottom_bar.dart';

class HomeHostScreen extends StatefulWidget {
  static const route = "home_host_screen";

  const HomeHostScreen({super.key});

  @override
  State<HomeHostScreen> createState() => _HomeHostScreenState();
}

class _HomeHostScreenState extends State<HomeHostScreen> {
  var _bottomBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(
          currentIndex: _bottomBarIndex,
          onItemSelected: (index) {
            setState(() {
              _bottomBarIndex = index;
            });
          }),
      body: SafeArea(
        child: switch (_bottomBarIndex) {
          0 => const HomeScreen(),
          1 => const DiscoverScreen(),
          _ => Container()
        },
      ),
    );
  }
}
