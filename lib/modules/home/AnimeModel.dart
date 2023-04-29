class AnimeModel{

  int id;
  String title, main_picture, synopsis, status;
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
      id: json['id'],
      title: json['title'],
      main_picture: json['main_picture'],
      synopsis: json['synopsis'],
      status: json['status'],
      start_date: json['start_date'],
    );

}