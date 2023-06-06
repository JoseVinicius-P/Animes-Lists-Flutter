import 'dart:async';
import 'dart:convert';

import 'package:anime_lists/shared/models/anime_model_mal.dart';
import 'package:anime_lists/shared/interfaces/i_anime_model.dart';
import 'package:anime_lists/modules/home/interfaces/i_search_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

class SearchRepositoryJikan implements Disposable, ISearchRepository{
  Timer? _delay;

  @override
  void dispose() {

  }

  @override
  Future<List<IAnimeModel>> fetchAnimes(String query) async{

    final response = await http.get(
      Uri.parse("https://api.jikan.moe/v4/anime?limit=20&q=$query&sfw"),
    );

    if(response.statusCode == 200){
      final decodedJson = jsonDecode(response.body);
      final results = decodedJson['data'] as List;
      List<IAnimeModel> animes = results.where((json){
        return json['approved'];
      }).map((json) => Modular.get<IAnimeModel>().setFromJson(json)).toList();
      print(animes.length);
      return animes;
    }else{
      throw ("ERRO");
    }
  }

}