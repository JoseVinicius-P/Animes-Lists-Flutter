import 'package:anime_lists/shared/interfaces/i_list_model.dart';
import 'package:anime_lists/shared/interfaces/i_list_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ListService implements IListService{
  final db = FirebaseFirestore.instance;

  @override
  Stream<QuerySnapshot> fetchLists(){
    return FirebaseFirestore.instance.collection("Users/${FirebaseAuth.instance.currentUser!.uid}/Lists").snapshots();
  }
}