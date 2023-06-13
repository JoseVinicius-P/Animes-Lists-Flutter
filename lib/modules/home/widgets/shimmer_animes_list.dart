import 'package:anime_lists/shared/utilities/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerAnimesList extends StatelessWidget {
  final int qtAnimes;
  final bool isPortrait;

  const ShimmerAnimesList({
    super.key, required this.qtAnimes, required this.isPortrait,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return SizedBox(
      height: isPortrait ? qtAnimes*85 : qtAnimes/2*85.round(),
      child: LayoutBuilder(
          builder: (context, constraints) {
            return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: qtAnimes,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isPortrait ? 1 : 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: isPortrait ? constraints.maxWidth/70 : (constraints.maxWidth/2)/70,
                ),
                itemBuilder: (context, index) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade900.withOpacity(0.5),
                    highlightColor: MyColors.backgroundColor,
                    enabled: true,
                    child: Row(
                      children: [
                        Container(
                          width: 46,
                          height: 70.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10.0)
                            ),
                            color: MyColors.backgroundColor,
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5.0)
                              ),
                              color: MyColors.backgroundColor,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                                  style: theme.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
            );
          }
      ),
    );
  }
}