import 'package:anime_lists/modules/add_to_list/interfaces/i_list_model.dart';
import 'package:anime_lists/modules/add_to_list/interfaces/i_list_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddToListController implements Disposable{
  final textController = TextEditingController();
  final IListService listService;

  AddToListController(this.listService);

  @override
  void dispose() {
    textController.dispose();
  }

  Future<List<IListModel>> fetchLists() async{
    return await listService.fetchLists();
  }

}