import 'package:anime_lists/shared/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerSearchAnime extends StatelessWidget {
  const ShimmerSearchAnime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade900.withOpacity(0.5),
        highlightColor: MyColors.backgroundColor,
        enabled: true,
        child: ListView.builder(
          itemBuilder: (_, __) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 122.0,
                  height: 170.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(24.0)
                    ),
                    color: MyColors.backgroundColor,
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 18.0,
                        color: MyColors.backgroundColor,
                      ),
                      SizedBox(height: 4.0),
                      Container(
                        width: 50,
                        height: 18.0,
                        color: MyColors.backgroundColor,
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        height: 48.0,
                        color: MyColors.backgroundColor,
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 100.0,
                        height: 18.0,
                        color: MyColors.backgroundColor,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          itemCount: 6,
        ),
      ),
    );
  }
}