import 'package:anime_lists/shared/interfaces/i_anime_model.dart';
import 'package:anime_lists/modules/home/interfaces/i_search_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MySearchController implements Disposable{
  final ISearchRepository searchRepository;

  MySearchController(this.searchRepository);

  Future<List<IAnimeModel>> searchAnimes(String query) async{
    List<IAnimeModel> animes = await searchRepository.fetchAnimes(query);
    return animes;
  }

  void toDetailsModule(int id){
    Modular.to.pushNamed("./details/", arguments: id);
  }

  @override
  void dispose() {

  }
}