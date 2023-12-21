import 'package:flutter/material.dart';
import 'package:simar_test/data/models/news_item_dto.dart';
import 'package:simar_test/presentation/home/widgets/my_network_image.dart';

class NewsListItem extends StatelessWidget {
  final NewsItemDto dto;

  const NewsListItem({super.key, required this.dto});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
      child: Row(
        children: [
          SizedBox(
            height: 110,
            width: 110,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: MyNetworkImage(
                url: dto.urlToImage ?? 'https://picsum.photos/200',
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dto.source?.name ?? "",
                    style: const TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                      child: Text(
                    dto.description ?? "",
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w900),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: const MyNetworkImage(
                            url: 'https://picsum.photos/200',
                            isCircular: true,
                          ),
                        ),
                      ),
                      const SizedBox(width: 7),
                      Expanded(
                        child: Text(
                          '${dto.author}  •  ${dto.getPrettyTime()}',
                          style: const TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
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
