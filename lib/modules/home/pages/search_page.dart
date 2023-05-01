import 'package:anime_lists/modules/home/controllers/my_search_controller.dart';
import 'package:anime_lists/modules/home/interfaces/i_anime_model.dart';
import 'package:anime_lists/modules/home/widgets/anime_item_horizontal.dart';
import 'package:anime_lists/modules/home/widgets/text_form_field_neon.dart';
import 'package:anime_lists/shared/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:anime_lists/modules/home/models/AnimeModel.dart';
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