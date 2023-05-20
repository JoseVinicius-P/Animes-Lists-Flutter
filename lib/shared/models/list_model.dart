import 'package:anime_lists/shared/interfaces/i_list_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListModel implements IListModel{
  @override
  late String name, id;
  @override
  late int qt_animes;

  ListModel({
    required this.name,
    required this.id
  });

  ListModel.empty();

  @override
  ListModel setFromDocumentSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> docSnapshot){
    name = docSnapshot['name'];
    qt_animes = docSnapshot['qt_animes'];
    id = docSnapshot.id;
    return this;
  }

  @override
  void setName(String name) {
    this.name = name;
    qt_animes = 0;
    id = "create";
  }
}