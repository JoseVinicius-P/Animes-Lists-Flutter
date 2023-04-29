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
      id: json['node']['id'],
      title: json['node']['title'],
      main_picture: json['node']['main_picture']['large'],
      synopsis: json['node']['synopsis'],
      status: json['node']['status'],
      start_date: json['node']['start_date'],
    );

}