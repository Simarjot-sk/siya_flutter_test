import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:simar_test/data/models/news_item_dto.dart';
import 'package:simar_test/presentation/colors.dart';
import 'package:simar_test/presentation/details/details_screen.dart';
import 'package:simar_test/presentation/home/home_state_holder.dart';
import 'package:simar_test/presentation/home/widgets/error_section.dart';
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
  var _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CarouselSlider(
            items: widget.items
                .map(
                  (e) => InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        DetailsScreen.route,
                        arguments: e,
                      );
                    },
                    child: NewsCarousalItem(
                      dto: e,
                    ),
                  ),
                )
                .toList(),
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: true,
                viewportFraction: 0.8,
                aspectRatio: 2.0,
                initialPage: 0,
                onPageChanged: (page, _) {
                  setState(() {
                    _currentPage = page;
                  });
                }),
          ),
          const SizedBox(height: 10),
          CarousalIndicator(
            size: widget.items.length,
            currentIndex: _currentPage,
          )
        ],
      ),
    );
  }
}

class CarousalIndicator extends StatelessWidget {
  final int size;
  final int currentIndex;

  const CarousalIndicator(
      {super.key, required this.size, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        size,
        (index) {
          final selected = index == currentIndex;
          return Padding(
            padding: const EdgeInsets.all(3.0),
            child: AnimatedContainer(
              width: selected ? 30 : 8,
              height: 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: selected ? kBlue : Colors.blueGrey.shade100,
              ),
              duration: const Duration(milliseconds: 300),
            ),
          );
        },
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
      ErrorState error => ErrorSection(
          errorMessage: error.errorMessage,
          onRetryClicked: () {
            context.read<HomeStateHolder>().loadBreakingNews();
          },
        ),
      LoadingState _ => Container(
          height: 200,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          child: Shimmer.fromColors(
            baseColor: Colors.grey,
            enabled: true,
            highlightColor: Colors.grey.shade100,
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
        ),
    };
  }
}
