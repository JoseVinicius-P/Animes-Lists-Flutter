import 'dart:convert';

import 'package:anime_lists/modules/details/i_details_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:anime_lists/shared/interfaces/i_anime_model.dart';
import 'package:http/http.dart' as http;

class DetailsRepository implements Disposable, IDetailsRepository{

  @override
  void dispose() {
  }

  @override
  Future<IAnimeModel> fetchAnime(int id) async{

    final headers = {
      'Content-Type': 'application/json',
      'X-MAL-CLIENT-ID': 'b5636ab640297e69fdb7bacab4de306e'
    };

    final response = await http.get(
      Uri.parse("https://api.myanimelist.net/v2/anime/$id?fields=id,title,main_picture,status,synopsis,start_date,mean,num_episodes,broadcast,rating,studios"),
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