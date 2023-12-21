import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simar_test/presentation/home/home_state_holder.dart';
import 'package:simar_test/presentation/home/widgets/heading.dart';
import 'package:simar_test/presentation/home/widgets/news_carousal.dart';
import 'package:simar_test/presentation/home/widgets/news_list_item.dart';
import 'package:simar_test/presentation/home/widgets/top_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final homeStateHolder = context.read<HomeStateHolder>();
      homeStateHolder.loadBreakingNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Heading(headingText: 'Breaking News'),
            const NewsCarousalSection(),
            const Heading(headingText: 'Recommendations'),
            for (int i = 0; i < 5; i++) const NewsListItem()
          ],
        ),
      ),
    );
  }
}
