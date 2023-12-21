import 'package:flutter/material.dart';
import 'package:simar_test/data/models/news_item_dto.dart';
import 'package:simar_test/presentation/home/widgets/my_chip.dart';
import 'package:simar_test/presentation/home/widgets/my_network_image.dart';

class NewsCarousalItem extends StatelessWidget {
  final NewsItemDto dto;

  const NewsCarousalItem({super.key, required this.dto});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: MyNetworkImage(url: dto.urlToImage ?? ''),
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: MyChip(text: dto.source?.name ?? ""),
          ),
          Positioned.fill(
            bottom: 16,
            left: 16,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    dto.description ?? "",
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
