import 'package:anime_lists/shared/interfaces/i_anime_model.dart';
import 'package:anime_lists/shared/interfaces/i_list_model.dart';
import 'package:anime_lists/modules/add_to_list/interfaces/i_anime_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AnimeService implements IAnimeService{
  final db = FirebaseFirestore.instance;

  @override
  Future<bool> saveAnime(IListModel listModel, IAnimeModel animeModel) async{
    final anime = <String, dynamic>{
      "id": animeModel.id,
      "title": animeModel.title,
      "main_picture": animeModel.main_picture,
    };

    if(listModel.id == "create"){
      final batch = db.batch();
      var userRef = db.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid);
      batch.set(userRef, {"name": FirebaseAuth.instance.currentUser?.displayName});
      var listRef = db.collection("Users/${FirebaseAuth.instance.currentUser!.uid}/Lists").doc();
      batch.set(listRef, {
        "name": listModel.name,
        "qt_animes": 1,
        "order": 0,
      });
      var animeRef = db.collection("Users/${FirebaseAuth.instance.currentUser!.uid}/Lists/${listRef.id}/Animes").doc(animeModel.id.toString());
      batch.set(animeRef, anime);
      try{
        await batch.commit();
        return true;
      }catch(e){
        return false;
      }
    }else{
      if(await docExists(listModel.id, animeModel.id.toString())){
        return true;
      }else{
        final batch = db.batch();
        var listRef = db.collection("Users/${FirebaseAuth.instance.currentUser!.uid}/Lists").doc(listModel.id);
        batch.update(listRef, {
          "qt_animes": FieldValue.increment(1),
        });
        var animeRef = db.collection("Users/${FirebaseAuth.instance.currentUser!.uid}/Lists/${listModel.id}/Animes")
            .doc(animeModel.id.toString());
        batch.set(animeRef, anime);
        try{
          await batch.commit();
          return true;
        }catch(e){
          return false;
        }
      }
    }
  }

  // Verificar se o documento existe antes de fazer a inserção
  Future<bool> docExists (String idList, String idDoc) async {
    DocumentSnapshot documento = await db.doc("Users/${FirebaseAuth.instance.currentUser!.uid}/Lists/$idList/Animes/$idDoc")
        .get();

    return documento.exists;
  }


}