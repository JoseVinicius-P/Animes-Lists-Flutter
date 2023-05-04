import 'package:anime_lists/shared/interfaces/i_anime_model.dart';
import 'package:flutter/material.dart';

class AnimeItemHorizontal extends StatelessWidget {
  final IAnimeModel anime;
  const AnimeItemHorizontal({
    super.key,
    required this.anime,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(24),
          ),
          child: Image.network(
            anime.main_picture,
            height: 170,
            width: 122,
            fit: BoxFit.cover,
            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace){
              return Container(
                width: 122,
                height: 170,
                decoration: BoxDecoration(
                  color: Colors.black38.withOpacity(0.2)
                ),
                child: Icon(Icons.signal_wifi_connected_no_internet_4_rounded, color: Colors.white.withOpacity(0.3)),
              );
            },
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: SizedBox(
            height: 170,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      anime.title,
                      style: theme.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      anime.start_date.year.toString(),
                      style: theme.textTheme.labelSmall!.copyWith(color: Colors.white.withOpacity(0.4), fontSize: 16),
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Text(
                  anime.synopsis,
                  style: theme.textTheme.labelSmall!.copyWith(fontSize: 14, color: Colors.white.withOpacity(0.5)),
                  textAlign: TextAlign.justify,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  anime.status,
                  style: theme.textTheme.labelSmall!.copyWith(fontSize: 14, color: Colors.red.withOpacity(0.4)),
                  textAlign: TextAlign.end,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}