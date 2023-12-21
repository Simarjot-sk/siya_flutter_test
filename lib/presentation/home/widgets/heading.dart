import 'package:flutter/material.dart';
import 'package:simar_test/presentation/colors.dart';

class Heading extends StatelessWidget {
  final String headingText;

  const Heading({super.key, required this.headingText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Row(
        children: [
          Text(
            headingText,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20, fontFamily: ''),
          ),
          const Spacer(),
          const Text(
            'View all',
            style: TextStyle(color: kBlue),
          )
        ],
      ),
    );
  }
}
