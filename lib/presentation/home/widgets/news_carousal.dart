import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simar_test/data/models/news_item_dto.dart';
import 'package:simar_test/presentation/home/home_state_holder.dart';
import 'package:simar_test/presentation/home/widgets/news_carousal_item.dart';
import 'package:simar_test/presentation/utils/action_state.dart';

class NewsCarousal extends StatefulWidget {
  final List<NewsItemDto> items;

  const NewsCarousal({super.key, required this.items});

  @override
  State<NewsCarousal> createState() => _NewsCarousalState();
}

class _NewsCarousalState extends State<NewsCarousal> {
  final _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: widget.items
          .map(
            (e) => NewsCarousalItem(
              dto: e,
            ),
          )
          .toList(),
      carouselController: _controller,
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.8,
        aspectRatio: 2.0,
        initialPage: 2,
      ),
    );
  }
}

class NewsCarousalSection extends StatelessWidget {
  const NewsCarousalSection({super.key});

  @override
  Widget build(BuildContext context) {
    final state =
        context.select<HomeStateHolder, ActionState<List<NewsItemDto>>>(
      (stateHolder) => stateHolder.loadBreakingNewsState,
    );
    return switch (state) {
      SuccessState success => NewsCarousal(items: success.data),
      ErrorState error => Container(
          child: Text(error.errorMessage),
        ),
      LoadingState _ => Container(
          child: Text("loading"),
        ),
    };
  }
}
