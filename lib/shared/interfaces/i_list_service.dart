import 'package:anime_lists/shared/interfaces/i_list_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IListService{
  Stream<QuerySnapshot> fetchStreamLists();
  Future<List<IListModel>> fetchLists();
}