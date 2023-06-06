import 'package:flutter_modular/flutter_modular.dart';

class ArgsService{
  bool hasAnimeId(){
    bool has;
    try{
      has = Modular.args.data['id'] != null;
    }catch (e){
      has = false;
    }

    return has;
  }

  bool hasAnime(){
    bool has;
    try{
      has = Modular.args.data['anime'] != null;
    }catch (e){
      has = false;
    }
    return has;
  }
}