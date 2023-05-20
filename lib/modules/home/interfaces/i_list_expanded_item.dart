import 'package:anime_lists/shared/interfaces/i_anime_model.dart';
import 'package:anime_lists/shared/interfaces/i_list_model.dart';

abstract class IListExpandedItem {

  late IListModel list;
  late bool isExpanded, isAnimesLoad;
  late Future<List<IAnimeModel>> _listAnime;

  void setListAnime(Future<List<IAnimeModel>> listAnime);
  void setList(IListModel list);

  Future<List<IAnimeModel>> getListAnime();
}