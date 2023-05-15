import 'package:anime_lists/modules/add_to_list/interfaces/i_list_model.dart';
import 'package:anime_lists/modules/add_to_list/interfaces/i_list_service.dart';
import 'package:anime_lists/modules/add_to_list/models/list_model.dart';
import 'package:anime_lists/shared/interfaces/i_anime_model.dart';
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

  @override
  Future<bool> saveAnime(IListModel listModel, int idAnime) async{
    final anime = <String, int>{
      "id": idAnime,
    };

    if(listModel.id == "create"){
      final batch = db.batch();
      var userRef = db.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid);
      batch.set(userRef, {"name": FirebaseAuth.instance.currentUser?.displayName});
      var listRef = db.collection("Users/${FirebaseAuth.instance.currentUser!.uid}/Lists").doc();
      batch.set(listRef, {"name": listModel.name});
      var animeRef = db.collection("Users/${FirebaseAuth.instance.currentUser!.uid}/Lists/${listRef.id}/Animes").doc(idAnime.toString());
      batch.set(animeRef, anime);
      try{
        await batch.commit();
        return true;
      }catch(e){
        return false;
      }
    }else{
      var animeRef = db.collection("Users/${FirebaseAuth.instance.currentUser!.uid}/Lists/${listModel.id}/Animes")
          .doc(idAnime.toString());
      try{
        await animeRef.set(anime);
        return true;
      }catch(e){
        return false;
      }
    }
  }


}