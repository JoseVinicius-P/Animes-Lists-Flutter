import 'package:anime_lists/modules/home/interfaces/i_anime_service.dart';
import 'package:anime_lists/shared/interfaces/i_anime_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AnimeService implements IAnimeService{
  final db = FirebaseFirestore.instance;

  @override
  Stream<QuerySnapshot> fetchAnimes(String idLista) {
    return FirebaseFirestore.instance.collection("Users/${FirebaseAuth.instance.currentUser!.uid}/Lists/$idLista/Animes").snapshots();
  }

  @override
  void setMark(int mark, String idList, String idAnime) {
    var animeRef = db.collection("Users/${FirebaseAuth.instance.currentUser!.uid}/Lists/${idList}/Animes").doc(idAnime);
    animeRef.set({'mark': mark}, SetOptions(merge: true));
  }
}