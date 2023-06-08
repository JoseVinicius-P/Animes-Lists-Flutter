import 'package:anime_lists/modules/home/interfaces/i_list_expanded_item.dart';
import 'package:anime_lists/shared/interfaces/i_anime_model.dart';
import 'package:anime_lists/shared/interfaces/i_list_model.dart';
import 'package:anime_lists/shared/interfaces/i_list_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:anime_lists/modules/home/interfaces/i_anime_service.dart';

class ListController implements Disposable{
  final IListService listService;
  final IAnimeService animeService;

  ListController(this.listService, this.animeService);

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

  List<IListModel> parseToListOfListModel(List<QueryDocumentSnapshot<Map<String, dynamic>>> docs){
    List<IListModel> lists = [];
    for (var docSnapshot in docs) {
      lists.add(Modular.get<IListModel>().setFromDocumentSnapshot(docSnapshot));
    }
    return lists;
  }

  IAnimeModel parseToAnimeModel(QueryDocumentSnapshot<Map<String, dynamic>> doc){
    return Modular.get<IAnimeModel>().setFromDocumentSnapshot(doc);
  }

  Stream<QuerySnapshot> fetchAnimes(String idLista){
    return animeService.fetchAnimes(idLista);
  }

  Stream<QuerySnapshot> fetchLists(){
    return listService.fetchStreamLists();
  }

  void toDetailsModule(int id, IListModel list){
    Modular.to.pushNamed("./details/", arguments: {
      'id': id,
      'list': list,
    });
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    Modular.to.popUntil((route) => route.isFirst);
    Modular.to.navigate('/login/');
  }

  void toManageListsModule() {
    Modular.to.pushNamed("./manage_lists/");
  }
}