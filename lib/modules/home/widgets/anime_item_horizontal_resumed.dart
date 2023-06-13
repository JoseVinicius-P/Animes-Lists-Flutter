import 'dart:async';
import 'package:anime_lists/modules/home/controllers/lists_controller.dart';
import 'package:anime_lists/shared/interfaces/i_anime_model.dart';
import 'package:anime_lists/shared/interfaces/i_list_model.dart';
import 'package:anime_lists/shared/utilities/my_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AnimeItemHorizontalResumed extends StatefulWidget {
  final IAnimeModel anime;
  final IListModel list;

  const AnimeItemHorizontalResumed({
    super.key, required this.anime, required this.list,
  });

  @override
  State<AnimeItemHorizontalResumed> createState() => _AnimeItemHorizontalResumedState();
}

class _AnimeItemHorizontalResumedState extends State<AnimeItemHorizontalResumed> {
  late int cont;
  var listController = Modular.get<ListController>();
  Timer? delay;
  bool isActive = false;

  @override
  void initState() {
    super.initState();
    cont = widget.anime.mark;
  }

  Color getColor(int mark){
    switch(mark){
      case 1:
        return MyColors.primaryColor;
      case 2:
        return MyColors.accentColor;
      case 3:
        return Colors.yellow;
      case 4:
        return Colors.red;
      default:
        return MyColors.backgroundColor;
    }
  }

  void updateMark(){
    setState(() {
      if(cont < 4){
        cont++;
      }else{
        cont = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);


    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          child: CachedNetworkImage(
            imageUrl: widget.anime.main_picture,
            width: 46,
            height: 70,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 10,),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.anime.title,
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
          onTap: () {
            updateMark();
            delay?.cancel();
            setState(() {
              isActive = true;
              delay = Timer(const Duration(milliseconds: 2000), () {
                isActive = false;
                listController.setMark(cont, widget.list.id.toString(), widget.anime.id.toString());
              });
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: 10,
              height: 40,
              color: isActive ? getColor(cont).withOpacity(0.2) : getColor(widget.anime.mark).withOpacity(0.2),
            ),
          ),
        )

      ],
    );
  }
}