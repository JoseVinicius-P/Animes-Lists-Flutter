import 'package:anime_lists/modules/add_to_list/interfaces/i_list_model.dart';

abstract class IListService{
  Future<List<IListModel>> fetchLists();
}