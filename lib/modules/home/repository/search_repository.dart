import 'dart:convert';

import 'package:anime_lists/modules/home/AnimeModel.dart';
import 'package:anime_lists/modules/home/interfaces/i_search_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

class SearchRepository implements Disposable, ISearchRepository{

  @override
  void dispose() {

  }

  @override
  Future<List<AnimeModel>> fetchAnimes(String query) async{
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
      List<AnimeModel> animes = results.map((json) => AnimeModel.fromJson(json)).toList();
      return animes;
    }else{
      print("ERRO: ${response.statusCode}");
      throw Exception("ERRO");
    }
  }

}