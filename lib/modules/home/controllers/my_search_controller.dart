import 'package:anime_lists/modules/home/AnimeModel.dart';
import 'package:anime_lists/modules/home/interfaces/i_search_repository.dart';
import 'package:anime_lists/modules/home/repository/search_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MySearchController implements Disposable{
  final ISearchRepository searchRepository;

  MySearchController(this.searchRepository);

  Future<List<AnimeModel>> searchAnimes(String query) async{
    List<AnimeModel> animes = await searchRepository.fetchAnimes(query);
    return animes;
  }

  @override
  void dispose() {

  }
}