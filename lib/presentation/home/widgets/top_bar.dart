import 'package:flutter/material.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          GrayContainer(icon: Icons.menu),
          Spacer(),
          GrayContainer(icon: Icons.search),
          SizedBox(width: 10),
          GrayContainer(icon: Icons.notifications_outlined),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(88);
}

class GrayContainer extends StatelessWidget {
  final IconData icon;

  const GrayContainer({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Colors.grey.shade200),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(icon),
      ),
    );
  }
}
