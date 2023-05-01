import 'package:anime_lists/modules/home/interfaces/i_anime_model.dart';

abstract class ISearchRepository{
  Future<List<IAnimeModel>> fetchAnimes(String query);
}