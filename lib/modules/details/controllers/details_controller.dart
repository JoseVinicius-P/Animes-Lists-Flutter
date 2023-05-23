import 'package:anime_lists/modules/details/interfaces/i_anime_service.dart';
import 'package:anime_lists/modules/details/interfaces/i_details_repository.dart';
import 'package:anime_lists/shared/interfaces/i_anime_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DetailsController implements Disposable{
  final IDetailsRepository detailsRepository;
  final IAnimeService animeService;

  DetailsController(this.detailsRepository, this.animeService);

  @override
  void dispose() {

  }

  void toAddToListModule(IAnimeModel anime){
    Modular.to.pushNamed('./add_to_list/', arguments: anime);
  }

  Future<IAnimeModel> getAnimeDetails(int id){
    return detailsRepository.fetchAnime(id);
  }

  void deleteAnime(String idAnime, String idLista){
    animeService.deleteAnime(idAnime, idLista);
  }
}