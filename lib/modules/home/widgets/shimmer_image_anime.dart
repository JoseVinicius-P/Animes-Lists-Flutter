import 'package:anime_lists/shared/utilities/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerImageAnime extends StatelessWidget {
  const ShimmerImageAnime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade900.withOpacity(0.5),
      highlightColor: MyColors.backgroundColor,
      enabled: true,
      child: Container(
        width: 122.0,
        height: 170.0,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(24.0)
          ),
          color: MyColors.backgroundColor,
        ),
      ),
    );
  }
}