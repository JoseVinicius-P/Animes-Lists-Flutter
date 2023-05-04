import 'package:anime_lists/modules/login/login_module.dart';
import 'package:anime_lists/shared/interfaces/i_anime_model.dart';
import 'package:anime_lists/shared/models/anime_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module{
  @override
  List<Bind> get binds => [
    Bind.factory<IAnimeModel>((i) => AnimeModel.empty()),
  ];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/', module: LoginModule()),
  ];
}