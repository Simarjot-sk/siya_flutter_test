import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:simar_test/data/models/news_item_dto.dart';
import 'package:simar_test/presentation/home/home_state_holder.dart';
import 'package:simar_test/presentation/home/widgets/error_section.dart';
import 'package:simar_test/presentation/home/widgets/news_list_item.dart';
import 'package:simar_test/presentation/utils/action_state.dart';

class RecommendationSection extends StatelessWidget {
  const RecommendationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final state =
        context.select<HomeStateHolder, ActionState<List<NewsItemDto>>>(
      (state) => state.loadRecommendationsState,
    );
    return switch (state) {
      SuccessState<List<NewsItemDto>> success => Column(
          children: success.data
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                  child: NewsListItem(
                    dto: e,
                  ),
                ),
              )
              .toList(),
        ),
      ErrorState error => ErrorSection(
          errorMessage: error.errorMessage,
          onRetryClicked: () {
            context.read<HomeStateHolder>().loadRecommendations();
          },
        ),
      LoadingState _ => Column(
          children: List.generate(
            5,
            (index) => const Padding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: SizedBox(
                  height: 100,
                  child: Row(
                    children: [
                      ShimmerContainer(width: 100, height: 100),
                      SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShimmerContainer(width: 100, height: 20),
                          ShimmerContainer(width: 40, height: 20)
                        ],
                      )
                    ],
                  ),
                )),
          ),
        ),
    };
  }
}

class ShimmerContainer extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;

  const ShimmerContainer(
      {super.key,
      required this.width,
      required this.height,
      this.borderRadius = 20});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      enabled: true,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(borderRadius)),
      ),
    );
  }
}
