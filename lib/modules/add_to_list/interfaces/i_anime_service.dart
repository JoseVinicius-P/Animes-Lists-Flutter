import 'package:anime_lists/shared/interfaces/i_anime_model.dart';
import 'package:anime_lists/shared/interfaces/i_list_model.dart';

abstract class IAnimeService{
  Future<bool> saveAnime(IListModel listModel, IAnimeModel animeModel);
}