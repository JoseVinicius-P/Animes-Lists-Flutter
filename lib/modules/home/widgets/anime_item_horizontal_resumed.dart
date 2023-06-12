import 'package:anime_lists/shared/interfaces/i_anime_model.dart';
import 'package:anime_lists/shared/utilities/my_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AnimeItemHorizontalResumed extends StatelessWidget {
  final IAnimeModel anime;

  const AnimeItemHorizontalResumed({
    super.key, required this.anime,
  });

  Color getColor(int mark){
    switch(mark){
      case 1:
        return MyColors.primaryColor;
      case 2:
        return MyColors.accentColor;
      case 3:
        return Colors.yellow;
      case 4:
        return Colors.green;
      default:
        return MyColors.backgroundColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Row(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          child: CachedNetworkImage(
            imageUrl: anime.main_picture,
            width: 46,
            height: 70,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 10,),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                anime.title,
                style: theme.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
                textAlign: TextAlign.start,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        const SizedBox(width: 10,),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => {},
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: 10,
              height: 40,
              color: getColor(anime.mark).withOpacity(0.2),
            ),
          ),
        )
        
      ],
    );
  }
}