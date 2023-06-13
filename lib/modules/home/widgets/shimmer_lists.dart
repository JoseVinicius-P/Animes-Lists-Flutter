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
      child: Column(
        children: [
          SizedBox(height: 8,),
          ListView.separated(
            itemCount: 10,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 3.0),
                child: Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: MyColors.backgroundColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Text(
                        "Minha lista Minha Lista",
                        style: theme.textTheme.labelSmall!.copyWith(fontSize: 20),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Icon(Icons.sort, color: Colors.white),
                    const Spacer(),
                    Icon(Icons.expand_more, color: Colors.white, size: 27,),
                    SizedBox(width: 20,)
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 15);
            },
          ),
        ],
      ),
    );
  }
}