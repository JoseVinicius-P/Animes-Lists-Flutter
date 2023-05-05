import 'package:anime_lists/shared/interfaces/i_anime_model.dart';

class AnimeModel implements IAnimeModel{

  @override
  late int id;
  @override
  late String title, main_picture, synopsis, status;
  @override
  late DateTime start_date;

  AnimeModel({
    required this.id,
    required this.title,
    required this.main_picture,
    required this.synopsis,
    required this.status,
    required this.start_date,
  });

  AnimeModel.empty();

  @override
  AnimeModel setFromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    main_picture = json['main_picture']['large'];
    synopsis = json['synopsis'];
    status = json['status'];
    start_date = DateTime.parse(json['start_date']);
    return this;
  }

}