import 'package:anime_lists/modules/home/AnimeModel.dart';
import 'package:anime_lists/modules/home/search_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MySearchController implements Disposable{

  Future<List<AnimeModel>> searchAnimes(String query){
    return SearchRepository().fetchAnimes(query);
  }

  @override
  void dispose() {

  }
}