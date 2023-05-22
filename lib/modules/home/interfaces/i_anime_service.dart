import 'package:anime_lists/shared/interfaces/i_anime_model.dart';

abstract class IAnimeService{
  Future<List<IAnimeModel>> fetchAnimes(String idLista);
}