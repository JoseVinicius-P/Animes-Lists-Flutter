import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IListService{
  Stream<QuerySnapshot> fetchLists();
}