import 'package:anime_lists/shared/utilities/my_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class IconAnimeImage extends StatelessWidget {
  const IconAnimeImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(3.0),
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return CachedNetworkImage(
                fit: BoxFit.cover,
                placeholder: (context, url) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade900.withOpacity(
                        0.5),
                    highlightColor: MyColors.backgroundColor,
                    enabled: true,
                    child: Container(
                      width: constraints.maxHeight/1.5,
                      height: constraints.maxHeight,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(3.0)
                        ),
                        color: MyColors.backgroundColor,
                      ),
                    ),
                  );
                },
                imageUrl: imageUrl
            );
          }
      ),
    );
  }
}