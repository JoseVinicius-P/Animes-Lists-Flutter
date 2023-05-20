import 'package:anime_lists/shared/interfaces/i_list_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListModel implements IListModel{
  @override
  late String name, id;

  ListModel({
    required this.name,
    required this.id
  });

  ListModel.empty();

  @override
  ListModel setFromDocumentSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> docSnapshot){
    name = docSnapshot['name'];
    id = docSnapshot.id;
    return this;
  }

  @override
  void setName(String name) {
    this.name = name;
    id = "create";
  }
}