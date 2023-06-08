import 'package:anime_lists/modules/manage_lists/interfaces/i_order_lists_service.dart';
import 'package:anime_lists/shared/interfaces/i_list_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OrderListService implements IOrderListsService{
  final db = FirebaseFirestore.instance;

  @override
  Future<bool> orderLists(List<IListModel> oldOrder, List<IListModel> newOrder) async{
    bool isSaved = false;
    final batch = db.batch();

    for(int i = 0; i < newOrder.length; i++){
      if(oldOrder[i].id != newOrder[i].id){
        var listRef = db.collection("Users/${FirebaseAuth.instance.currentUser!.uid}/Lists").doc(newOrder[i].id);
        batch.update(listRef, {'order': i});
      }
    }
    await batch.commit().then((value) {
      isSaved = true;
    });
    return isSaved;
  }
  
}