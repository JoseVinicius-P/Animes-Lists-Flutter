import 'package:anime_lists/modules/details/details_repository.dart';
import 'package:anime_lists/shared/interfaces/i_anime_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DetailsController implements Disposable{

  @override
  void dispose() {

  }

  Future<IAnimeModel> getAnimeDetails(int id){
    return DetailsRepository().fetchAnime(id);
  }

}