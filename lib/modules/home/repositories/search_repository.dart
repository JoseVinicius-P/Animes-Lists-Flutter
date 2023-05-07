import 'dart:convert';

import 'package:anime_lists/shared/models/anime_model.dart';
import 'package:anime_lists/shared/interfaces/i_anime_model.dart';
import 'package:anime_lists/modules/home/interfaces/i_search_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

class SearchRepository implements Disposable, ISearchRepository{


  @override
  void dispose() {

  }

  @override
  Future<List<IAnimeModel>> fetchAnimes(String query) async{

    final headers = {
      'Content-Type': 'application/json',
      'X-MAL-CLIENT-ID': 'b5636ab640297e69fdb7bacab4de306e'
    };

    final response = await http.get(
      Uri.parse("https://api.myanimelist.net/v2/anime?q=$query&fields=id,title,main_picture,synopsis,status,start_date"),
      headers: headers);

    if(response.statusCode == 200){
      final decodedJson = jsonDecode(response.body);
      final results = decodedJson['data'] as List;
      List<IAnimeModel> animes = results.map((json) => Modular.get<IAnimeModel>().setFromJson(json['node'])).toList();
      return animes;
    }else{
      return fetchAnimes(query);
    }
  }

}