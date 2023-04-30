import 'package:anime_lists/modules/home/AnimeModel.dart';
import 'package:anime_lists/modules/home/search_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MySearchController implements Disposable{
  final SearchRepository searchRepository;

  MySearchController(this.searchRepository);

  Future<List<AnimeModel>> searchAnimes(String query) async{
    //Convertendo a future de lista dinametica retornada em uma Future<List<AnimeModel>
    //O then está sendo usado para acessar o valor dentro do future e o manipular
    List<AnimeModel> animes = await searchRepository.fetchAnimes(query).then((results) => results.map((json) => AnimeModel.fromJson(json)).toList());
    return animes;
  }

  @override
  void dispose() {

  }
}