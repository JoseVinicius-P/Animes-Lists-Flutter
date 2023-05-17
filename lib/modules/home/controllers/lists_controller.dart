import 'package:anime_lists/shared/interfaces/i_list_model.dart';
import 'package:anime_lists/shared/interfaces/i_list_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ListController implements Disposable{
  final IListService listService;

  ListController(this.listService);

  @override
  void dispose() {

  }

  Future<List<IListModel>> fetchLists() async{
    return await listService.fetchLists();
  }

}