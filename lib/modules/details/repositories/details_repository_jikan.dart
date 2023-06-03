import 'dart:convert';

import 'package:anime_lists/modules/details/interfaces/i_details_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:anime_lists/shared/interfaces/i_anime_model.dart';
import 'package:http/http.dart' as http;

class DetailsRepositoryJikan implements Disposable, IDetailsRepository{

  @override
  void dispose() {
  }

  @override
  Future<IAnimeModel> fetchAnime(int id) async{

    final response = await http.get(
      Uri.parse("https://api.jikan.moe/v4/anime/$id"),
    );

    if(response.statusCode == 200){
      final Map<String, dynamic> decodedJson = jsonDecode(response.body);
      return Modular.get<IAnimeModel>().setFromJson(decodedJson['data']);
    }else{
      return fetchAnime(id);
    }
  }

}