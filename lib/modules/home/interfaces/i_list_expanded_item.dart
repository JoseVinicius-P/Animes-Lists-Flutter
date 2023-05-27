import 'package:anime_lists/shared/interfaces/i_anime_model.dart';
import 'package:anime_lists/shared/interfaces/i_list_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IListExpandedItem {

  late IListModel list;
  late bool isExpanded, isAnimesLoad;
  late Stream<QuerySnapshot> _streamListAnime;

  void setStreamListAnime(Stream<QuerySnapshot> listAnime);
  void setList(IListModel list);

  Stream<QuerySnapshot> getStreamListAnime();
}