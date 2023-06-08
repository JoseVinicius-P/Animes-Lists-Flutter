import 'package:anime_lists/shared/interfaces/i_list_model.dart';
import 'package:anime_lists/shared/interfaces/i_list_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ManageListsController implements Disposable{
  final IListService listService;

  ManageListsController(this.listService);

  @override
  void dispose() {

  }

  Future<List<IListModel>> fetchLists() async{
    return await listService.fetchLists();
  }

  List<IListModel> parseToListOfListModel(List<QueryDocumentSnapshot<Map<String, dynamic>>> docs){
    List<IListModel> lists = [];
    for (var docSnapshot in docs) {
      lists.add(Modular.get<IListModel>().setFromDocumentSnapshot(docSnapshot));
    }
    return lists;
  }

}