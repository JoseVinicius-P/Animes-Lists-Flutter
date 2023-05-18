import 'package:anime_lists/modules/home/models/list_expanded_item.dart';
import 'package:anime_lists/shared/interfaces/i_anime_model.dart';
import 'package:anime_lists/shared/interfaces/i_list_model.dart';
import 'package:anime_lists/shared/interfaces/i_list_service.dart';
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

  Future<List<IAnimeModel>> fetchAnimes(String idLista) async {
    List<int> idsAnimes = await animeService.fetchIdsAnimes(idLista);
    List<IAnimeModel> animes = [];

    for(int idAnime in idsAnimes){
      animes.add(await animeRepository.fetchAnime(idAnime));
    }

    return animes;
  }
}