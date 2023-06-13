import 'package:anime_lists/shared/utilities/my_colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerDetailsAnime extends StatelessWidget {
  const ShimmerDetailsAnime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var buttonWidth = 55.sw.roundToDouble();

    Widget showShimmerImage(bool isPortrait){
      return Expanded(
        flex: isPortrait ? 0 : 1,
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade900.withOpacity(0.5),
          highlightColor: MyColors.backgroundColor,
          enabled: true,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: isPortrait ? MediaQuery.of(context).size.width : double.infinity,
                    height: isPortrait ? MediaQuery.of(context).size.width : MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(10.0)
                      ),
                      color: MyColors.backgroundColor,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: isPortrait ? 130 : MediaQuery.of(context).size.height,
                      width: isPortrait ? double.infinity : 130,
                      decoration: BoxDecoration(
                        color: MyColors.backgroundColor,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget showShimmerData(bool isPortrait){
      return Expanded(
        flex: isPortrait ? 0 : 2,
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade900.withOpacity(0.5),
          highlightColor: MyColors.backgroundColor,
          enabled: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
                  child: Column(
                    children: [
                      SizedBox(height: 3,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(3.0)
                              ),
                              color: MyColors.backgroundColor,
                            ),
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: isPortrait ? 50.sw : 38.sh,
                              ),
                              child: AutoSizeText(
                                "AAAAAAAAAAAAAAAAAAAAA",
                                style: theme.textTheme.titleMedium,
                                textAlign: TextAlign.left,
                                maxLines: 1,
                                minFontSize: 22,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(3.0)
                              ),
                              color: MyColors.backgroundColor,
                            ),
                            child: Text(
                              "2023",
                              style: theme.textTheme.labelSmall!.copyWith(color: Colors.white.withOpacity(0.2), fontSize: 15),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.star_rounded,
                            color: Colors.yellow.withOpacity(0.5),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(3.0)
                              ),
                              color: MyColors.backgroundColor,
                            ),
                            child: Text(
                              "10.00",
                              style: theme.textTheme.labelSmall!.copyWith(color: Colors.white.withOpacity(0.5)),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(3.0)
                              ),
                              color: MyColors.backgroundColor,
                            ),
                            child: Text(
                              "Studio",
                              style: theme.textTheme.labelSmall!.copyWith(color: Colors.white.withOpacity(0.5), fontSize: 15),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          const SizedBox(width: 15),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(3.0)
                              ),
                              color: MyColors.backgroundColor,
                            ),
                            child: Text(
                              "+10",
                              style: theme.textTheme.labelSmall!.copyWith(color: Colors.white.withOpacity(0.5), fontSize: 15),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          const SizedBox(width: 15),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(3.0)
                              ),
                              color: MyColors.backgroundColor,
                            ),
                            child: Text(
                              "24 episodios",
                              style: theme.textTheme.labelSmall!.copyWith(color: Colors.white.withOpacity(0.7), fontSize: 15),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(3.0)
                              ),
                              color: MyColors.backgroundColor,
                            ),
                            child: Text(
                              "Finalizado",
                              style: theme.textTheme.labelSmall!.copyWith(fontSize: 15, color: MyColors.primaryColor.withOpacity(0.6)),
                              textAlign: TextAlign.end,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Flexible(
                            fit: FlexFit.loose,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(3.0)
                                ),
                                color: MyColors.backgroundColor,
                              ),
                              child: Text(
                                "AAAAAAAAAAAA A AAAAAAAAAAAAAAAA AAAAAAAAAAAAAAAAAAAAA AAAAAAAAAAAAAAAAAAAAA AAAAAAAAAAAAAAAAAAAAAAAAAAAAA AAAAAAAAAAAAAAAAAAAAAAAAAA AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA A AAAAAAAAAA A AAAAAAAAAAAAAAAA A AAAAAAAAAA",
                                style: theme.textTheme.labelSmall!.copyWith(color: Colors.white.withOpacity(0.3), fontSize: 17),
                                textAlign: TextAlign.justify,
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Container(
                         width: buttonWidth,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(25.0)
                          ),
                          color: MyColors.backgroundColor,
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return OrientationLayoutBuilder(
      portrait: (context){
        return Column(
          children: [
            showShimmerImage(true),
            showShimmerData(true),
          ],
        );
      },
      landscape: (context){
        return Row(
          children: [
            showShimmerImage(false),
            showShimmerData(false),
          ],
        );
      },
    )
      /*Shimmer.fromColors(
        baseColor: Colors.grey.shade900.withOpacity(0.5),
        highlightColor: MyColors.backgroundColor,
        enabled: true,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width - 15,
              decoration: const BoxDecoration(
                color: MyColors.backgroundColor,
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: MyColors.backgroundColor,
                    ),
                    child: AutoSizeText(
                      "Kimetsu no Yaiba",
                      style: theme.textTheme.titleMedium,
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      minFontSize: 22,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: MediaQuery.of(context).size.width/2.2,
                    decoration: const BoxDecoration(
                      color: MyColors.backgroundColor,
                    ),
                    child: Text(
                      "ufotable",
                      style: theme.textTheme.labelSmall!.copyWith(color: Colors.white.withOpacity(0.5), fontSize: 15),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    decoration: const BoxDecoration(
                      color: MyColors.backgroundColor,
                    ),
                    child: Text(
                      "Finalizada",
                      style: theme.textTheme.labelSmall!.copyWith(fontSize: 15, color: MyColors.primaryColor.withOpacity(0.6)),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    decoration: const BoxDecoration(
                      color: MyColors.backgroundColor,
                    ),
                    child: Text(
                      "AAAAA AAAAAAAAAAA AAA AAAAAAAAAAAAAAAA AAAAAAAAAAAAAAA AAAAAAAAAAAAAAAAAAA AA AAAAAAAAAAAA AAAAAAAAAA AAAAAAAAAAAA AAAAAAAAAAAAAA AAAAAAAAAAAAAAA AAAAAAAAAAAAAAAAAAAA A AAAAAAAAAAAAAA AAAAAAAAAA AAAAAAAAAAA AAAAAAAAAA AAAAAAAAAAAAAAAAA AAAAAAAAAAAAAA AAAAAAAAAAAAA AAAAAAAAAAAAA AAAAAAAAAAA",
                      style: theme.textTheme.labelSmall!.copyWith(color: Colors.white.withOpacity(0.3), fontSize: 17),
                      textAlign: TextAlign.justify,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 100),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 200,
                        decoration: const BoxDecoration(
                          color: MyColors.backgroundColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        )
    )*/;
  }
}