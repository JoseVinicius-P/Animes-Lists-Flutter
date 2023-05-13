import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IListModel{
  late String name, id;

  IListModel setFromDocumentSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> docSnapshot);
}