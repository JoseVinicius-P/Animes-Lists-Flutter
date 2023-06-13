import 'package:anime_lists/modules/home/controllers/my_search_controller.dart';
import 'package:anime_lists/shared/interfaces/i_anime_model.dart';
import 'package:anime_lists/modules/home/widgets/anime_item_horizontal.dart';
import 'package:anime_lists/modules/home/widgets/shimmer_search_anime.dart';
import 'package:anime_lists/modules/home/widgets/text_form_field_neon.dart';
import 'package:anime_lists/shared/utilities/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchController = Modular.get<MySearchController>();
  late Future<List<IAnimeModel>> futureListAnimes = Future.value([]);
  Key key = UniqueKey();

  void updateSearch(String text){
    setState(() {
      futureListAnimes = searchController.searchAnimes(text);
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    Widget showSearchResult(bool isPortrait){
      return FutureBuilder<List<IAnimeModel>>(
          key: key,
          future: futureListAnimes,
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return ShimmerSearchAnime(isPortrait: isPortrait);
            }else{
              if(snapshot.data!.isNotEmpty){
                return Expanded(
                  child: LayoutBuilder(
                      builder: (context, constraints) {
                        return GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: isPortrait ? 1 : 2,
                              mainAxisSpacing: 15,
                              crossAxisSpacing: 15,
                              childAspectRatio: isPortrait ? constraints.maxWidth/170 : (constraints.maxWidth/2)/170,
                            ),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data?.length ?? 0,
                            itemBuilder: (context, index){
                              return GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () => searchController.toDetailsModule(snapshot.data![index].id),
                                onLongPress: () => searchController.toAddToListModule(snapshot.data![index]),
                                child: AnimeItemHorizontal(anime: snapshot.data![index]),
                              );
                            }
                        );
                      }
                  ),
                );
              }else{
                if(searchController.textEditingController.text.length > 3){
                  return Column(
                    children: [
                      const SizedBox(height: 30),
                      Icon(
                        Icons.search_off,
                        color: Colors.white.withOpacity(0.5),
                        size: 35,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Nenhum anime encontrato!',
                            style: theme.textTheme.titleSmall!.copyWith(fontSize: 18, color: Colors.white.withOpacity(0.5)),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  );
                }else{
                  return const SizedBox();
                }
              }
            }
          }
      );
    }

    return Stack(
      children: [
        Container(
          width: double.infinity,
          color: MyColors.backgroundColor,
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 2.sh.roundToDouble(), left: 30.0, right: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Pesquisar animes',
                  style: theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 10),
                TextFormFieldNeon(onTextChange: (text) => updateSearch(text)),
                const SizedBox(height: 20),
                OrientationLayoutBuilder(
                  portrait: (context) => showSearchResult(true),
                  landscape: (context) => showSearchResult(false),
                )
              ],
            ),
          )
        )
      ]
    );
  }
}