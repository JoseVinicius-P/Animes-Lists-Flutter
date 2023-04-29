import 'dart:convert';

import 'package:anime_lists/modules/home/AnimeModel.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

class SearchRepository implements Disposable{

  @override
  void dispose() {

  }

  Future<String> fetchAnimes() async{

    final headers = {
      'Content-Type': 'application/json',
      'X-MAL-CLIENT-ID': 'b5636ab640297e69fdb7bacab4de306e'
    };

    final response = await http.get(
      Uri.parse("https://api.myanimelist.net/v2/anime?q=Kimetsu no Yaiba"),
      headers: headers);

    if(response.statusCode == 200){
      print(jsonDecode(response.body));
      return jsonDecode(response.body);
    }else{
      print("ERRO: ${response.statusCode}");
      throw Exception("ERRO");
    }
  }

}