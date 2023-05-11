import 'package:anime_lists/modules/details/controllers/details_controller.dart';
import 'package:anime_lists/shared/utilities/my_colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:anime_lists/shared/interfaces/i_anime_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DetailsPage extends StatefulWidget {
  final int id;

  const DetailsPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final detailsController = Modular.get<DetailsController>();
  late Future<IAnimeModel> futureAnime;

  @override
  void initState() {
    super.initState();
    futureAnime = detailsController.getAnimeDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
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
                return Column(
                  children: [
                    Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: snapshot.data!.main_picture,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width,
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
                            height: 130,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    MyColors.backgroundColor,
                                    Colors.transparent,
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  stops: [0.0, 1.0],
                                  tileMode: TileMode.clamp,
                                )
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: (MediaQuery.of(context).size.width/2),
                                child: AutoSizeText(
                                  snapshot.data!.title,
                                  style: theme.textTheme.titleMedium,
                                  textAlign: TextAlign.left,
                                  maxLines: 1,
                                  minFontSize: 22,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                snapshot.data!.start_date.year.toString(),
                                style: theme.textTheme.labelSmall!.copyWith(color: Colors.white.withOpacity(0.2), fontSize: 15),
                                textAlign: TextAlign.left,
                              ),
                              const Spacer(),
                              Icon(
                                Icons.star_rounded,
                                color: Colors.yellow.withOpacity(0.5),
                              ),
                              Text(
                                snapshot.data!.mean.toString(),
                                style: theme.textTheme.labelSmall!.copyWith(color: Colors.white.withOpacity(0.5)),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                snapshot.data!.studio,
                                style: theme.textTheme.labelSmall!.copyWith(color: Colors.white.withOpacity(0.5), fontSize: 15),
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(width: 15),
                              Text(
                                snapshot.data!.rating,
                                style: theme.textTheme.labelSmall!.copyWith(color: Colors.white.withOpacity(0.5), fontSize: 15),
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(width: 15),
                              Text(
                                "${snapshot.data!.num_episodes} episodios",
                                style: theme.textTheme.labelSmall!.copyWith(color: Colors.white.withOpacity(0.7), fontSize: 15),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Text(
                                snapshot.data!.status,
                                style: theme.textTheme.labelSmall!.copyWith(fontSize: 15, color: MyColors.primaryColor.withOpacity(0.6)),
                                textAlign: TextAlign.end,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              snapshot.data!.status == 'Em exibição'? Text(
                                ": ",
                                style: theme.textTheme.labelSmall!.copyWith(fontSize: 15, color: MyColors.primaryColor.withOpacity(0.6)),
                                textAlign: TextAlign.end,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ):const SizedBox(),
                              snapshot.data!.status == 'Em exibição'? Text(
                                "${snapshot.data!.day_of_the_week} as ",
                                style: theme.textTheme.labelSmall!.copyWith(fontSize: 15, color: MyColors.primaryColor.withOpacity(0.6)),
                                textAlign: TextAlign.end,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ):const SizedBox(),
                              snapshot.data!.status == 'Em exibição'? Text(
                                " ${snapshot.data!.start_time} horas",
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
                              Expanded(
                                child: Text(
                                  snapshot.data!.synopsis,
                                  style: theme.textTheme.labelSmall!.copyWith(color: Colors.white.withOpacity(0.3), fontSize: 17),
                                  textAlign: TextAlign.justify,
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 100),
                          AddToListButton(),
                        ],
                      ),
                    ),
                  ],
                );
              }else{
                return const SizedBox();
              }
            }
          ),

        ],
      ),
    );
  }
}

class AddToListButton extends StatelessWidget {
  const AddToListButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return InkWell(
      onTap: () {

      },
      child: Container(
        height: 50,
        width: 200,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(25),
            ),
            border: Border.all(
              width: 2,
              style: BorderStyle.solid,
              color: Colors.transparent,
            ),
            gradient: const LinearGradient(
              colors: [
                MyColors.primaryColor,
                MyColors.accentColor,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: MyColors.primaryColor.withOpacity(0.2),
                spreadRadius: 0.1,
                blurRadius: 15,
                offset: const Offset(-5, -5),
              ),
              BoxShadow(
                color: MyColors.accentColor.withOpacity(0.2),
                spreadRadius: 0.1,
                blurRadius: 15,
                offset: const Offset(5, 5),
              )
            ]
        ),
        child: SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
              color: MyColors.backgroundColor.withOpacity(0.9),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Adicionar a uma lista',
                    style: theme.textTheme.labelMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}