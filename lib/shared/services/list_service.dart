import 'package:anime_lists/shared/interfaces/i_list_model.dart';
import 'package:anime_lists/shared/interfaces/i_list_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ListService implements IListService{
  final db = FirebaseFirestore.instance;

  @override
  Future<List<IListModel>> fetchLists() async{
    List<IListModel> lists = [];
    await db.collection("Users/${FirebaseAuth.instance.currentUser!.uid}/Lists").get().then((querySnapshot) {
      for (var docSnapshot in querySnapshot.docs) {
        lists.add(Modular.get<IListModel>().setFromDocumentSnapshot(docSnapshot));
      }
    },
      onError: (e) => print("Error completing: $e"),
    );
    return lists;
  }
}