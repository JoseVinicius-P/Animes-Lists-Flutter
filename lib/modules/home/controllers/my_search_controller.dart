import 'package:anime_lists/modules/home/search_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MySearchController implements Disposable{

  void getAnime(){
    SearchRepository().fetchAnimes();
  }

  @override
  void dispose() {

  }
}