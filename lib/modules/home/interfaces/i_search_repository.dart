import 'package:anime_lists/modules/home/AnimeModel.dart';

abstract class ISearchRepository{
  Future<List<AnimeModel>> fetchAnimes(String query);
}