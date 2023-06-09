import 'package:anime_lists/shared/interfaces/i_anime_model.dart';
import 'package:anime_lists/shared/utilities/day_of_week_interpreter.dart';
import 'package:anime_lists/shared/utilities/status_interpreter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AnimeModelMal implements IAnimeModel{

  @override
  late int id, num_episodes;
  @override
  late String title, main_picture, synopsis,
      status, day_of_the_week,
      start_time, rating, studio;
  @override
  late DateTime start_date;
  @override
  late double mean;
  @override
  late int mark;

  AnimeModelMal({
    required this.id,
    required this.title,
    required this.main_picture,
    required this.synopsis,
    required this.status,
    required this.start_date,
    required this.mean,
    required this.day_of_the_week,
    required this.num_episodes,
    required this.rating,
    required this.start_time,
    required this.studio,
  });

  AnimeModelMal.empty();
  /*num_episodes, day_of_the_week, start_time*/

  @override
  IAnimeModel setFromJson(Map<String, dynamic> json){
    id = json['id'] ?? 0;
    num_episodes = json['num_episodes'] ?? 0;
    title = json['title'] ?? '';
    main_picture = json['main_picture']['large'] ?? '';
    synopsis = json['synopsis'] ?? '';
    status = StatusInterpreter.getStatus(json['status'] ?? '');
    day_of_the_week = DayOfWeekInterpreter.getNameOfWeekDay(json['broadcast']?['day_of_the_week'] ?? '');
    start_time = json['broadcast']?['start_time'] ?? '';
    rating = json['rating'] ?? '';
    studio = json['studios']?[0]['name'] ?? '';
    start_date = DateTime.parse(json['start_date']);
    mean = json['mean'] ?? 0.0;
    return this;
  }

  @override
  IAnimeModel setFromDocumentSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> docSnapshot) {
    title = docSnapshot['title'];
    main_picture = docSnapshot['main_picture'];
    id = int.parse(docSnapshot.id);
    mark = docSnapshot['mark'] ?? 0;
    return this;
  }

}