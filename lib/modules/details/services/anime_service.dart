

import 'package:anime_lists/modules/details/interfaces/i_anime_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AnimeService implements IAnimeService{
  final db = FirebaseFirestore.instance;

  @override
  void deleteAnime(String idAnime, String idLista) async {
    final listRef = db.collection("Users/${FirebaseAuth.instance.currentUser!.uid}/Lists").doc(idLista);
    final AnimeRef = db.collection("Users/${FirebaseAuth.instance.currentUser!.uid}/Lists/$idLista/Animes").doc(idAnime);
    db.runTransaction((transaction) async {
      final snapshot = await transaction.get(listRef);
      if(snapshot.get("qt_animes") <= 1){
        transaction.delete(AnimeRef);
        transaction.delete(listRef);
      }else{
        transaction.delete(AnimeRef);
        transaction.update(listRef, {"qt_animes": FieldValue.increment(-1)});
      }
    }).then(
          (value) => print("DocumentSnapshot successfully updated!"),
      onError: (e) => print("Error updating document $e"),
    );
  }
}