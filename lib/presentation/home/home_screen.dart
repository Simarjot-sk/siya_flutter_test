import 'package:flutter/material.dart';
import 'package:simar_test/presentation/home/widgets/heading.dart';
import 'package:simar_test/presentation/home/widgets/news_carousal.dart';
import 'package:simar_test/presentation/home/widgets/news_list_item.dart';
import 'package:simar_test/presentation/home/widgets/top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Heading(headingText: 'Breaking News'),
            const NewsCarousal(),
            const Heading(headingText: 'Recommendations'),
            for (int i = 0; i < 5; i++) const NewsListItem()
          ],
        ),
      ),
    );
  }
}
