import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simar_test/presentation/home/home_state_holder.dart';
import 'package:simar_test/presentation/home/widgets/heading.dart';
import 'package:simar_test/presentation/home/widgets/news_carousal.dart';
import 'package:simar_test/presentation/home/widgets/news_list_item.dart';
import 'package:simar_test/presentation/home/widgets/recommendation_section.dart';
import 'package:simar_test/presentation/home/widgets/top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(),
      body: RefreshIndicator(
        onRefresh: () {
          context.read<HomeStateHolder>()
            ..loadRecommendations()
            ..loadBreakingNews();
          return Future.value();
        },
        child: const SingleChildScrollView(
          child: Column(
            children: [
              Heading(headingText: 'Breaking News'),
              NewsCarousalSection(),
              Heading(headingText: 'Recommendations'),
              SizedBox(height: 10),
              RecommendationSection()
            ],
          ),
        ),
      ),
    );
  }
}
