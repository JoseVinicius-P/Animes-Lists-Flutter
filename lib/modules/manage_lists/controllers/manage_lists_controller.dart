import 'dart:async';

import 'package:anime_lists/shared/interfaces/i_list_model.dart';
import 'package:anime_lists/shared/interfaces/i_list_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:anime_lists/modules/manage_lists/interfaces/i_order_lists_service.dart';

class ManageListsController implements Disposable{
  final IListService listService;
  final IOrderListsService orderListsService;
  bool savingInProgress = false;

  ManageListsController(this.listService, this.orderListsService);

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

  void orderLists(List<IListModel> newOrder) async {
    savingInProgress = true;
    var isSuccess = await orderListsService.orderLists(newOrder);
    if(isSuccess){
      Modular.to.pop();
      savingInProgress = false;
    }else{
      savingInProgress = false;
    }
  }

}