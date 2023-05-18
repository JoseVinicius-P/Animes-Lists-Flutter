import 'package:anime_lists/modules/home/interfaces/i_anime_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AnimeService implements IAnimeService{
  final db = FirebaseFirestore.instance;

  @override
  Future<List<int>> fetchIdsAnimes(String idLista) async {
    List<int> idsAnimes = [];
    await db.collection("Users/${FirebaseAuth.instance.currentUser!.uid}/Lists/$idLista/Animes").get().then((querySnapshot) {
      for (var docSnapshot in querySnapshot.docs) {
        idsAnimes.add(int.parse(docSnapshot.id));
      }
    },
      onError: (e) => print("Error completing: $e"),
    );
    return idsAnimes;
  }
}