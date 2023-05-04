import 'package:anime_lists/shared/interfaces/i_anime_model.dart';

class AnimeModel implements IAnimeModel{

  @override
  int id;
  @override
  String title, main_picture, synopsis, status;
  @override
  DateTime start_date;

  AnimeModel({
    required this.id,
    required this.title,
    required this.main_picture,
    required this.synopsis,
    required this.status,
    required this.start_date,
  });

  factory AnimeModel.fromJson(Map<String, dynamic> json) =>
    AnimeModel(
      id: json['node']['id'],
      title: json['node']['title'],
      main_picture: json['node']['main_picture']['large'],
      synopsis: json['node']['synopsis'],
      status: json['node']['status'],
      start_date: DateTime.parse(json['node']['start_date']),
    );

}