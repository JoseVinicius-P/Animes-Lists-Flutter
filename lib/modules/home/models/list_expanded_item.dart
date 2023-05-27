import 'package:anime_lists/modules/home/interfaces/i_list_expanded_item.dart';
import 'package:anime_lists/shared/interfaces/i_anime_model.dart';
import 'package:anime_lists/shared/interfaces/i_list_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListExpandedItem implements IListExpandedItem{

  @override
  late IListModel list;
  @override
  bool isExpanded = false, isAnimesLoad = false;
  Stream<QuerySnapshot> _streamListAnime = const Stream.empty();

  ListExpandedItem({
    required this.list,
    this.isExpanded = false,
    this.isAnimesLoad = false,
  });

  ListExpandedItem.empty();

  @override
  void setStreamListAnime(Stream<QuerySnapshot> streamListAnime){
    _streamListAnime = streamListAnime;
    isAnimesLoad = true;
  }

  @override
  Stream<QuerySnapshot> getStreamListAnime(){
    return _streamListAnime;
  }

  @override
  void setList(IListModel list) {
    this.list = list;
  }
}