import 'package:flutter/material.dart';
import 'package:simar_test/presentation/colors.dart';

class MyChip extends StatelessWidget {
  final bool isSelected;
  final String text;

  const MyChip({super.key, required this.text, this.isSelected = true});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isSelected ? kBlue : Colors.grey.shade100;
    final textColor = isSelected ? Colors.white : Colors.grey;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16),
        child: Text(
          text,
          style: TextStyle(color: textColor,fontSize: 10, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
