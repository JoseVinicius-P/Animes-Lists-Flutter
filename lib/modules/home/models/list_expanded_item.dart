import 'package:anime_lists/shared/interfaces/i_anime_model.dart';
import 'package:anime_lists/shared/interfaces/i_list_model.dart';

class ListExpandedItem {
  ListExpandedItem({
    required this.list,
    this.isExpanded = false,
  });

  IListModel list;
  bool isExpanded, _isAnimesLoad = false;
  late Future<List<IAnimeModel>> _listAnime;

  void setListAnime(Future<List<IAnimeModel>> listAnime){
    _listAnime = listAnime;
    _isAnimesLoad = true;
  }
}