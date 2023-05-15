import 'package:anime_lists/shared/interfaces/i_list_model.dart';

abstract class IAnimeService{
  Future<bool> saveAnime(IListModel listModel, int idAnime);
}