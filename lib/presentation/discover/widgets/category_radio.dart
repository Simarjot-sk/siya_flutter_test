import 'package:flutter/material.dart';
import 'package:simar_test/data/models/categories.dart';
import 'package:simar_test/presentation/home/widgets/my_chip.dart';

class CategoryRadio extends StatelessWidget {
  final NewsCategory selectedCategory;
  final ValueChanged<NewsCategory> onCategoryClicked;

  const CategoryRadio(
      {super.key, required this.selectedCategory, required this.onCategoryClicked});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: NewsCategory.values.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final cat = NewsCategory.values[index];
        return Padding(
          padding: const EdgeInsets.only(right: 10),
          child: InkWell(
            onTap: () {
              onCategoryClicked(cat);
            },
            child: MyChip(
              text: cat.name.capitalize(),
              isSelected: cat == selectedCategory,
            ),
          ),
        );
      },
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
