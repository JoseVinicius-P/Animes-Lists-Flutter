import 'package:anime_lists/modules/home/interfaces/i_anime_service.dart';
import 'package:anime_lists/shared/interfaces/i_anime_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AnimeService implements IAnimeService{
  final db = FirebaseFirestore.instance;

  @override
  Future<List<IAnimeModel>> fetchAnimes(String idLista) async {
    List<IAnimeModel> animes = [];
    await db.collection("Users/${FirebaseAuth.instance.currentUser!.uid}/Lists/$idLista/Animes").get().then((querySnapshot) {
      for (var docSnapshot in querySnapshot.docs) {
        animes.add(Modular.get<IAnimeModel>().setFromDocumentSnapshot(docSnapshot));
      }
    },
      onError: (e) => print("Error completing: $e"),
    );
    return animes;
  }
}