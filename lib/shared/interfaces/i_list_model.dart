import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IListModel{
  late String name, id;
  late int qt_animes;

  IListModel setFromDocumentSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> docSnapshot);
  void setName(String name);
}