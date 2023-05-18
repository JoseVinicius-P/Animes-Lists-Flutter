import 'package:anime_lists/modules/add_to_list/add_to_list_module.dart';
import 'package:anime_lists/modules/home/controllers/home_controller.dart';
import 'package:anime_lists/modules/home/controllers/lists_controller.dart';
import 'package:anime_lists/modules/home/interfaces/i_anime_repository.dart';
import 'package:anime_lists/modules/home/interfaces/i_anime_service.dart';
import 'package:anime_lists/modules/home/interfaces/i_search_repository.dart';
import 'package:anime_lists/modules/home/pages/home_page.dart';
import 'package:anime_lists/modules/details/details_module.dart';
import 'package:anime_lists/modules/home/controllers/my_search_controller.dart';
import 'package:anime_lists/modules/home/repositories/anime_repository.dart';
import 'package:anime_lists/modules/home/repositories/search_repository.dart';
import 'package:anime_lists/modules/home/services/anime_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module{

  @override
  List<Bind> get binds => [
    //Injetando dependencia da Classe Controller
    Bind((i) => HomeController()),
    Bind<IAnimeService>((i) => AnimeService()),
    Bind<IAnimeRepository>((i) => AnimeRepository()),
    Bind((i) => ListController(i(), i(), i())),
    Bind<ISearchRepository>((i) => SearchRepository()),
    Bind((i) => MySearchController(i())),
  ];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute("/details", module: DetailsModule()),
    ChildRoute('/', child: (context, args) => const HomePage()),
  ];
}