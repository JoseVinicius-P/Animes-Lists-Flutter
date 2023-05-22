import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IAnimeModel{
  late int id, num_episodes;
  late String title, main_picture, synopsis, status, day_of_the_week, start_time, rating, studio;
  late DateTime start_date;
  late double mean;

  IAnimeModel setFromJson(Map<String, dynamic> json);
  IAnimeModel setFromDocumentSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> docSnapshot);
}