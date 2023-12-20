import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:simar_test/presentation/home/widgets/news_carousal_item.dart';

class NewsCarousal extends StatefulWidget {
  const NewsCarousal({super.key});

  @override
  State<NewsCarousal> createState() => _NewsCarousalState();
}

class _NewsCarousalState extends State<NewsCarousal> {
  final _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        for (int i = 0; i < 10; i++) const NewsCarousalItem(),
      ],
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
