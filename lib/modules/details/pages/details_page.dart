import 'package:anime_lists/modules/details/widgets/add_to_list_button.dart';
import 'package:anime_lists/modules/details/controllers/details_controller.dart';
import 'package:anime_lists/modules/home/widgets/shimmer_details_anime.dart';
import 'package:anime_lists/shared/utilities/my_colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:anime_lists/shared/interfaces/i_anime_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_builder/responsive_builder.dart';

class DetailsPage extends StatefulWidget {
  final int idAnime;
  final String? idList;

  const DetailsPage({
    Key? key,
    required this.idAnime, required this.idList,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final detailsController = Modular.get<DetailsController>();
  late Future<IAnimeModel> futureAnime;
  late IAnimeModel anime;
  String? idList;

  @override
  void initState() {
    super.initState();
    futureAnime = detailsController.getAnimeDetails(widget.idAnime);
    futureAnime.then((value) => anime = value);
    idList = widget.idList;
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    Widget showImage(String url, bool isPortrait){
      return Expanded(
        flex: isPortrait ? 0 : 1,
        child: Column(
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: url,
                  width: isPortrait ? MediaQuery.of(context).size.width : double.infinity,
                  height: isPortrait ? MediaQuery.of(context).size.width : MediaQuery.of(context).size.height,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error){
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.black38.withOpacity(0.2)
                      ),
                      child: Icon(Icons.signal_wifi_connected_no_internet_4_rounded, color: Colors.white.withOpacity(0.3)),
                    );
                  },
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: isPortrait ? 130 : MediaQuery.of(context).size.height,
                    width: isPortrait ? double.infinity : 130,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors:  [
                            isPortrait ? MyColors.backgroundColor : Colors.transparent,
                            isPortrait ? Colors.transparent : MyColors.backgroundColor,
                          ],
                          begin: isPortrait ? Alignment.bottomCenter : Alignment.topLeft,
                          end: isPortrait ? Alignment.topCenter : Alignment.topRight,
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp,
                        )
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }

    Widget showData(IAnimeModel animeModel, bool isPortrait){
      return Expanded(
        flex: isPortrait ? 0 : 2,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: isPortrait ? 50.sw : 38.sh,
                        child: AutoSizeText(
                          animeModel.title,
                          style: theme.textTheme.titleMedium,
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          minFontSize: 22,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        animeModel.start_date.year.toString(),
                        style: theme.textTheme.labelSmall!.copyWith(color: Colors.white.withOpacity(0.2), fontSize: 15),
                        textAlign: TextAlign.left,
                      ),
                      const Spacer(),
                      Icon(
                        Icons.star_rounded,
                        color: Colors.yellow.withOpacity(0.5),
                      ),
                      Text(
                        animeModel.mean.toString() ?? '',
                        style: theme.textTheme.labelSmall!.copyWith(color: Colors.white.withOpacity(0.5)),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        animeModel.studio ?? '',
                        style: theme.textTheme.labelSmall!.copyWith(color: Colors.white.withOpacity(0.5), fontSize: 15),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(width: 15),
                      Text(
                        animeModel.rating,
                        style: theme.textTheme.labelSmall!.copyWith(color: Colors.white.withOpacity(0.5), fontSize: 15),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(width: 15),
                      Text(
                        "${animeModel.num_episodes} episodios",
                        style: theme.textTheme.labelSmall!.copyWith(color: Colors.white.withOpacity(0.7), fontSize: 15),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        animeModel.status,
                        style: theme.textTheme.labelSmall!.copyWith(fontSize: 15, color: MyColors.primaryColor.withOpacity(0.6)),
                        textAlign: TextAlign.end,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      animeModel.status == 'Em exibição'? Text(
                        ": ",
                        style: theme.textTheme.labelSmall!.copyWith(fontSize: 15, color: MyColors.primaryColor.withOpacity(0.6)),
                        textAlign: TextAlign.end,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ):const SizedBox(),
                      animeModel.status == 'Em exibição'? Text(
                        "${animeModel.day_of_the_week} as ",
                        style: theme.textTheme.labelSmall!.copyWith(fontSize: 15, color: MyColors.primaryColor.withOpacity(0.6)),
                        textAlign: TextAlign.end,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ):const SizedBox(),
                      animeModel.status == 'Em exibição'? Text(
                        " ${animeModel.start_time} horas",
                        style: theme.textTheme.labelSmall!.copyWith(fontSize: 15, color: MyColors.primaryColor.withOpacity(0.6)),
                        textAlign: TextAlign.end,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ):const SizedBox(),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Flexible(
                        fit: FlexFit.loose,
                        child: Text(
                          animeModel.synopsis,
                          style: theme.textTheme.labelSmall!.copyWith(color: Colors.white.withOpacity(0.3), fontSize: 17),
                          textAlign: TextAlign.justify,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  AddToListButton(
                      onTap: () => detailsController.toAddToListModule(anime)
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget showScaffold(bool isPortrait){
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          iconTheme: const IconThemeData(
              color: Colors.white,
              shadows: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0, 0),
                  blurRadius: 30,
                )
              ]
          ),
          actions: [
            Visibility(
              visible: idList != null,
              child: IconButton(
                icon: const Icon(
                  Icons.bookmark,
                  size: 30,
                ),
                onPressed: () {
                  detailsController.deleteAnime(widget.idAnime.toString(), idList!);
                  setState(() {
                    idList = null;
                  });
                },
              ),
            )
          ],
          backgroundColor: Colors.transparent,
          forceMaterialTransparency: true,
        ),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              color: MyColors.backgroundColor,
            ),
            FutureBuilder<IAnimeModel>(
                future: futureAnime,
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    return isPortrait ?
                      Column(
                        children: [
                          showImage(snapshot.data!.main_picture, isPortrait),
                          showData(snapshot.data!, isPortrait),
                        ],
                      ):
                      Row(
                        children: [
                          showImage(snapshot.data!.main_picture, isPortrait),
                          showData(snapshot.data!, isPortrait),
                        ],
                      );
                  }else{
                    return const ShimmerDetailsAnime();
                  }
                }
            ),

          ],
        ),
      );
    }

    return OrientationLayoutBuilder(
      portrait: (context) => showScaffold(true),
      landscape: (context) => showScaffold(false),
    );
  }
}
