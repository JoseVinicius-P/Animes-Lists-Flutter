import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:anime_lists/shared/interfaces/i_anime_model.dart';
import 'package:http/http.dart' as http;

class DetailsRepository implements Disposable{
  @override
  void dispose() {
  }

  Future<IAnimeModel> fetchAnime(int id) async{

    final headers = {
      'Content-Type': 'application/json',
      'X-MAL-CLIENT-ID': 'b5636ab640297e69fdb7bacab4de306e'
    };

    final response = await http.get(
      Uri.parse("https://api.myanimelist.net/v2/anime/$id?fields=id,title,main_picture,synopsis,status,start_date"),
      headers: headers
    );

    if(response.statusCode == 200){
      final Map<String, dynamic> decodedJson = jsonDecode(response.body);
      return Modular.get<IAnimeModel>().setFromJson(decodedJson);
    }else{
      return fetchAnime(id);
    }
  }

}