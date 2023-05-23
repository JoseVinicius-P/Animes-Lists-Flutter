import 'package:anime_lists/shared/interfaces/i_anime_model.dart';

abstract class IAnimeService{
  void deleteAnime(String idAnime, String idLista);
}