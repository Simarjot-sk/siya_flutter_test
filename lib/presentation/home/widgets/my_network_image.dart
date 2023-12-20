import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyNetworkImage extends StatelessWidget {
  const MyNetworkImage({
    Key? key,
    required this.url,
    this.isCircular = false,
    this.showFadeInAnim = true, this.fit = BoxFit.cover,
  }) : super(key: key);

  final String url;
  final bool isCircular;
  final bool showFadeInAnim;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fadeInDuration:
          showFadeInAnim ? const Duration(milliseconds: 500) : Duration.zero,
      imageUrl: url,
      fit: fit,
      errorWidget: (_, __, ___) => const Icon(Icons.image),
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: Shimmer.fromColors(
          baseColor: Colors.grey,
          enabled: true,
          highlightColor: Colors.grey.shade100,
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}