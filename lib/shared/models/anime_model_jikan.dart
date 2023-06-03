import 'package:anime_lists/shared/interfaces/i_anime_model.dart';
import 'package:anime_lists/shared/utilities/day_of_week_interpreter.dart';
import 'package:anime_lists/shared/utilities/rating_interpreter.dart';
import 'package:anime_lists/shared/utilities/status_interpreter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AnimeModelJikan implements IAnimeModel{

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

  AnimeModelJikan({
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

  AnimeModelJikan.empty();
  /*num_episodes, day_of_the_week, start_time*/

  @override
  IAnimeModel setFromJson(Map<String, dynamic> json){
    mean = json['score'] ?? 0.0;
    id = json['mal_id'] ?? 0;
    num_episodes = json['episodes'] ?? 0;
    title = json['title'] ?? '';
    main_picture = json['images']['webp']['large_image_url'] ?? '';
    synopsis = json['synopsis'] ?? '';
    status = StatusInterpreter.getStatus(json['status'] ?? '');
    //Alterar DayOfWeekInterpreter
    day_of_the_week = DayOfWeekInterpreter.getNameOfWeekDay(json['broadcast']?['day'] ?? '');
    start_date = DateTime.parse(json['aired']['from']);
    start_time = json['broadcast']?['time'] ?? '';
    rating = RatingInterpreter.getRating(json['rating'] ?? '');
    try{
      studio = json['studios']?[0]['name'] ?? ' ';
    }catch (e){
      studio = '';
    }
    return this;
  }

  @override
  IAnimeModel setFromDocumentSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> docSnapshot) {
    title = docSnapshot['title'];
    main_picture = docSnapshot['main_picture'];
    id = int.parse(docSnapshot.id);
    return this;
  }

}