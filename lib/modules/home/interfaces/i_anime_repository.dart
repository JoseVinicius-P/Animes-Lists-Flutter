import 'package:anime_lists/shared/interfaces/i_anime_model.dart';

abstract class IAnimeRepository {
  Future<IAnimeModel> fetchAnime(int id);
}
