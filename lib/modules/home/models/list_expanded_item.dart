import 'package:anime_lists/shared/interfaces/i_anime_model.dart';
import 'package:anime_lists/shared/interfaces/i_list_model.dart';

class ListExpandedItem {
  ListExpandedItem({
    required this.list,
    this.isExpanded = false,
  });

  IListModel list;
  bool isExpanded, isAnimesLoad = false;
  Future<List<IAnimeModel>> _listAnime = Future.value([]);

  void setListAnime(Future<List<IAnimeModel>> listAnime){
    _listAnime = listAnime;
    isAnimesLoad = true;
  }

  Future<List<IAnimeModel>> getListAnime(){
    return _listAnime;
  }
}