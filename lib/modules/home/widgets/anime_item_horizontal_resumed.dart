import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AnimeItemHorizontalResumed extends StatelessWidget {
  const AnimeItemHorizontalResumed({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return InkWell(
      onTap: (){},
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            child: CachedNetworkImage(
              imageUrl: 'https:\/\/cdn.myanimelist.net\/images\/anime\/1286\/99889l.jpg',
              width: 46,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10,),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(
              'Kimetsu no Yaiba',
              style: theme.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
              textAlign: TextAlign.start,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
              Text(
                '2019',
                style: theme.textTheme.labelSmall!.copyWith(color: Colors.white.withOpacity(0.4), fontSize: 16),
                textAlign: TextAlign.start,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            ],
          )
        ],
      ),
    );
  }
}