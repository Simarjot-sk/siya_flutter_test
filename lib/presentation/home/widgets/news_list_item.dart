import 'package:flutter/material.dart';
import 'package:simar_test/presentation/home/widgets/my_network_image.dart';

class NewsListItem extends StatelessWidget {
  const NewsListItem({super.key});

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
              child: const MyNetworkImage(
                url: '',
              ),
            ),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'data',
                  style: TextStyle(color: Colors.grey),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Expanded(
                    child: Text(
                  'data sdf sd fsdfsdfs ds fsd fsd fsdf',
                  style: TextStyle(fontSize: 20),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: MyNetworkImage(
                        url: 'url',
                        isCircular: true,
                      ),
                    ),
                    SizedBox(width: 7),
                    Expanded(
                      child: Text(
                        'data sdf sdf sdf sdfsd sd sdfs sdfsdfsdf df',
                        style: TextStyle(color: Colors.grey),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
