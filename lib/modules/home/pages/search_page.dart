import 'package:anime_lists/modules/home/controllers/my_search_controller.dart';
import 'package:anime_lists/modules/home/interfaces/i_anime_model.dart';
import 'package:anime_lists/shared/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:anime_lists/modules/home/AnimeModel.dart';
import 'package:shimmer/shimmer.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchController = Modular.get<MySearchController>();
  late Future<List<IAnimeModel>> futureListAnimes = Future.value([]);

  @override
  void initState() {
    super.initState();

  }

  void updateSearch(String text){
    setState(() {
      futureListAnimes = searchController.searchAnimes(text);
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Stack(
      children: [
        Container(
          width: double.infinity,
          color: MyColors.backgroundColor,
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pesquisar animes',
                  style: theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 10),
                TextFormFieldNeon(onTextChange: (text) => updateSearch(text)),
                SizedBox(height: 20),
                Expanded(
                  child: FutureBuilder<List<IAnimeModel>>(
                    future: futureListAnimes,
                    builder: (context, snapshot){
                      if(snapshot.hasData){
                        return ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data?.length ?? 0,
                          // Define a altura do espaço entre os itens
                          separatorBuilder: (BuildContext context, int index) {
                              return SizedBox(height: 20);
                          },
                          itemBuilder: (context, index){
                            return AnimeItemHorizontal(anime: snapshot.data![index]);
                          }
                        );
                      }else{
                        return SizedBox(
                          height: 10,
                          child: Shimmer.fromColors(
                            baseColor: Colors.white.withOpacity(0.1),
                            highlightColor: Colors.white.withOpacity(0.4),
                            enabled: true,
                            child: Container(
                              height: 10,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.4),
                                borderRadius:const BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    }
                  ),
                )
              ],
            ),
          )
        )
      ]
    );
  }
}

class TextFormFieldNeon extends StatelessWidget {
  final Function onTextChange;

  const TextFormFieldNeon({
    super.key,
    required this.onTextChange
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
          borderRadius:BorderRadius.all(
            Radius.circular(30),
          ),
          border: Border.all(
            width: 1,
            style: BorderStyle.solid,
            color: Colors.transparent,
          ),
          gradient: LinearGradient(
            colors: [
              MyColors.primaryColor.withOpacity(0.4),
              MyColors.accentColor.withOpacity(0.4),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
          boxShadow: [
            BoxShadow(
              color: MyColors.primaryColor.withOpacity(0.3),
              spreadRadius: 0.1,
              blurRadius: 15,
              offset: const Offset(-3, -3),
            ),
            BoxShadow(
              color: MyColors.accentColor.withOpacity(0.3),
              spreadRadius: 0.1,
              blurRadius: 15,
              offset: const Offset(3, 3),
            )
          ]
      ),
      child: TextFormField(
        //Chamando função recebida do widget pai para alterar texto
        onChanged: (text) => onTextChange(text),
        //definindo estilo do texto
        style: const TextStyle(
          color: MyColors.textColor,
          fontSize: 15
        ),
        cursorColor: MyColors.textColor,
        //retirando autocorreção de texto
        autocorrect: false,
        //definindo estilo do container do textfield
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(30),
          ),
          //Definindo hint usando varivel da classe personalizada MyStrings
          hintText: 'Pesquisar animes',
          hintStyle: theme.textTheme.labelSmall!.copyWith(color: MyColors.textColor.withOpacity(0.2), fontSize: 15),
          //perimitindo preenchimento do container
          filled: true,
          fillColor: Colors.black.withOpacity(0.8),
        ),
      ),
    );
  }
}

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
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
          child: Image.network(
            anime.main_picture,
            height: 170,
            width: 122,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Container(
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
