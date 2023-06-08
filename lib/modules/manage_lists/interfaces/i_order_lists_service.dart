
import 'package:anime_lists/shared/interfaces/i_list_model.dart';

abstract class IOrderListsService{
  Future<bool> orderLists(List<IListModel> oldOrder, List<IListModel> newOrder);
}