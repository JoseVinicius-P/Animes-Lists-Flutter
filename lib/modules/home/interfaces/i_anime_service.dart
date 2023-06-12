import 'package:anime_lists/shared/interfaces/i_anime_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IAnimeService{
  Stream<QuerySnapshot> fetchAnimes(String idLista);
  void setMark(int mark, String idList, String idAnime);
}