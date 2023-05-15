import 'package:anime_lists/shared/interfaces/i_list_model.dart';

abstract class IListService{
  Future<List<IListModel>> fetchLists();
}