import 'package:anime_lists/shared/utilities/my_colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerDetailsAnime extends StatelessWidget {
  const ShimmerDetailsAnime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Shimmer.fromColors(
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
    );
  }
}