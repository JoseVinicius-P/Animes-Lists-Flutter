import 'package:anime_lists/modules/details/repositories/details_repository.dart';
import 'package:anime_lists/modules/details/interfaces/i_details_repository.dart';
import 'package:anime_lists/shared/interfaces/i_anime_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DetailsController implements Disposable{
  final IDetailsRepository detailsRepository;

  DetailsController(this.detailsRepository);

  @override
  void dispose() {

  }

  void toAddToListModule(int id){
    Modular.to.pushNamed('./add_to_list/', arguments: id);
  }

  Future<IAnimeModel> getAnimeDetails(int id){
    return detailsRepository.fetchAnime(id);
  }

}