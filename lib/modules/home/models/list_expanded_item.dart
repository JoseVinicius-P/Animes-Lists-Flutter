import 'package:anime_lists/modules/home/interfaces/i_list_expanded_item.dart';
import 'package:anime_lists/shared/interfaces/i_anime_model.dart';
import 'package:anime_lists/shared/interfaces/i_list_model.dart';

class ListExpandedItem implements IListExpandedItem{

  @override
  late IListModel list;
  @override
  bool isExpanded = false, isAnimesLoad = false;
  Future<List<IAnimeModel>> _listAnime = Future.value([]);

  ListExpandedItem({
    required this.list,
    this.isExpanded = false,
    this.isAnimesLoad = false,
  });

  ListExpandedItem.empty();

  @override
  void setListAnime(Future<List<IAnimeModel>> listAnime){
    _listAnime = listAnime;
    isAnimesLoad = true;
  }

  @override
  Future<List<IAnimeModel>> getListAnime(){
    return _listAnime;
  }

  @override
  void setList(IListModel list) {
    this.list = list;
  }
}