import 'package:flutter/material.dart';
import 'package:simar_test/presentation/home/widgets/my_chip.dart';
import 'package:simar_test/presentation/home/widgets/my_network_image.dart';

class NewsCarousalItem extends StatelessWidget {
  const NewsCarousalItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: const MyNetworkImage(url: ''),
          ),
          const Positioned(
            top: 16,
            left: 16,
            child: MyChip(text: 'Sports'),
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
                    'sldkfjlskdjfl sldkflskd jlskd sdf sdfsdfsdfsdf sdfsdfs sdf  ',
                    style: TextStyle(
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
