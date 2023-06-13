import 'package:anime_lists/shared/utilities/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLists extends StatelessWidget {
  const ShimmerLists({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Shimmer.fromColors(
      baseColor: Colors.grey.shade900.withOpacity(0.5),
      highlightColor: MyColors.backgroundColor,
      enabled: true,
      child: ListView.separated(
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: MyColors.backgroundColor,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Text(
              "Minha lista",
              style: theme.textTheme.labelSmall!.copyWith(fontSize: 20),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 15);
        },
      ),
    );
  }
}