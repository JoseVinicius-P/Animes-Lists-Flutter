import 'package:anime_lists/modules/home/home_module.dart';
import 'package:anime_lists/modules/login/login_module.dart';
import 'package:anime_lists/shared/interfaces/i_anime_model.dart';
import 'package:anime_lists/shared/interfaces/i_list_model.dart';
import 'package:anime_lists/shared/interfaces/i_list_service.dart';
import 'package:anime_lists/shared/models/anime_model_jikan.dart';
import 'package:anime_lists/shared/models/list_model.dart';
import 'package:anime_lists/shared/services/args_service.dart';
import 'package:anime_lists/shared/services/list_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module{

  @override
  List<Bind> get binds => [
    Bind.factory<IListService>((i) => ListService()),
    Bind.factory<IListModel>((i) => ListModel.empty()),
    Bind.factory<IAnimeModel>((i) => AnimeModelJikan.empty()),
    Bind((i) => ArgsService()),
  ];

  @override
  List<ModularRoute> get routes => [
    //ModuleRoute('/', module: AuthenticationService.isUserLoggedIn() ? HomeModule() : LoginModule()),
    ModuleRoute('/login', module: LoginModule(), transition: TransitionType.scale, duration: const Duration(milliseconds: 280)),
    ModuleRoute('/home', module: HomeModule()),
  ];
}