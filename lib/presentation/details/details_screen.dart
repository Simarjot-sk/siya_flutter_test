import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:simar_test/data/models/news_item_dto.dart';
import 'package:simar_test/presentation/colors.dart';
import 'package:simar_test/presentation/home/widgets/my_chip.dart';
import 'package:simar_test/presentation/home/widgets/my_network_image.dart';

class DetailsScreen extends StatelessWidget {
  static const route = "details_screen";

  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final newsItem = ModalRoute.of(context)?.settings.arguments as NewsItemDto;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        child: Stack(
          children: [
            Positioned(
                top: 0,
                child: SizedBox(
                    height: height * 0.4,
                    child: MyNetworkImage(url: newsItem.urlToImage ?? ""))),
            Positioned(
              child: Container(
                height: height * 0.4,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black87],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 36),
                child: _buildTopButtonRow(context),
              ),
            ),
            Positioned(
              top: 0,
              child: SizedBox(
                width: width,
                height: height * 0.4,
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: _buildBottomDetailsColumn(newsItem)),
              ),
            ),
            DraggableScrollableSheet(
              minChildSize: .6,
              initialChildSize: .6,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 50,
                              width: 50,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: const MyNetworkImage(
                                  url: 'https://picsum.photos/200',
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              newsItem.author ?? '',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Icon(
                              Icons.verified,
                              color: kBlue,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          newsItem.description ?? '',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomDetailsColumn(NewsItemDto dto) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyChip(text: dto.source?.name ?? ""),
          const SizedBox(height: 5),
          Expanded(
            child: Text(
              dto.title ?? "",
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            'Trending • ${dto.getPrettyTime()}',
            style: const TextStyle(color: Colors.white, fontSize: 12),
          )
        ],
      ),
    );
  }

  Widget _buildTopButtonRow(BuildContext context) {
    return Row(
      children: [
        InkWell(
          child: const BlurryContainer(
            child: Icon(
              Icons.navigate_before,
              color: Colors.white,
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        const Spacer(),
        const BlurryContainer(
          child: Icon(
            Icons.save_alt,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 10),
        const BlurryContainer(
          child: Icon(
            Icons.more_horiz,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class BlurryContainer extends StatelessWidget {
  final Widget child;

  const BlurryContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            decoration:
                BoxDecoration(color: Colors.grey.shade200.withOpacity(0.5)),
            child: Center(
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
