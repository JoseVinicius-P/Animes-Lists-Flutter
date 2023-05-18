import 'package:anime_lists/modules/home/models/list_expanded_item.dart';
import 'package:anime_lists/shared/interfaces/i_anime_model.dart';
import 'package:anime_lists/shared/interfaces/i_list_model.dart';
import 'package:anime_lists/shared/interfaces/i_list_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:anime_lists/modules/home/interfaces/i_anime_service.dart';

class ListController implements Disposable{
  final IListService listService;
  final IAnimeService animeService;

  ListController(this.listService, this.animeService);

  @override
  void dispose() {

  }

  Future<List<IListModel>> fetchLists() async{
    return await listService.fetchLists();
  }

  List<ListExpandedItem> generateItems(List<IListModel> lists) {
    return List<ListExpandedItem>.generate(lists.length, (int index) {
      return ListExpandedItem(
        list: lists[index],
      );
    });
  }

  Future<void> fetchAnimes(String idLista) async {
    List<String> idsAnimes = await animeService.fetchIdsAnimes(idLista);
    print(idsAnimes);
  }
}