import 'package:anime_lists/modules/home/interfaces/i_list_expanded_item.dart';
import 'package:anime_lists/modules/home/models/list_expanded_item.dart';
import 'package:anime_lists/shared/interfaces/i_anime_model.dart';
import 'package:anime_lists/shared/interfaces/i_list_model.dart';
import 'package:anime_lists/shared/interfaces/i_list_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:anime_lists/modules/home/interfaces/i_anime_service.dart';
import 'package:anime_lists/modules/home/interfaces/i_anime_repository.dart';

class ListController implements Disposable{
  final IListService listService;
  final IAnimeService animeService;
  final IAnimeRepository animeRepository;

  ListController(this.listService, this.animeService, this.animeRepository);

  @override
  void dispose() {

  }

  List<IListExpandedItem> generateItems(List<IListModel> lists) {
    return List<IListExpandedItem>.generate(lists.length, (int index) {
      IListExpandedItem listExpandedItem = Modular.get<IListExpandedItem>();
      listExpandedItem.setList(lists[index]);
      return listExpandedItem;
    });
  }

  List<IListModel> parseListModel(List<QueryDocumentSnapshot<Map<String, dynamic>>> docs){
    List<IListModel> lists = [];
    for (var docSnapshot in docs) {
      lists.add(Modular.get<IListModel>().setFromDocumentSnapshot(docSnapshot));
    }
    return lists;
  }

  Future<List<IAnimeModel>> fetchAnimes(String idLista) async {
    return animeService.fetchAnimes(idLista);
  }

  Stream<QuerySnapshot> fetchLists(){
    return listService.fetchLists();
  }

  void toDetailsModule(int id, String idList){
    Modular.to.pushNamed("./details/", arguments: {
      'id': id,
      'idList': idList,
    });
  }
}