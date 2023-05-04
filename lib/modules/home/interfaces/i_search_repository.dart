import 'package:anime_lists/shared/interfaces/i_anime_model.dart';

abstract class ISearchRepository{
  Future<List<IAnimeModel>> fetchAnimes(String query);
}