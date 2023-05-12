import 'package:anime_lists/modules/add_to_list/add_to_list_module.dart';
import 'package:anime_lists/modules/home/controllers/home_controller.dart';
import 'package:anime_lists/modules/home/controllers/lists_controller.dart';
import 'package:anime_lists/modules/home/interfaces/i_search_repository.dart';
import 'package:anime_lists/modules/home/pages/home_page.dart';
import 'package:anime_lists/modules/details/details_module.dart';
import 'package:anime_lists/modules/home/controllers/my_search_controller.dart';
import 'package:anime_lists/modules/home/repositories/search_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module{

  @override
  List<Bind> get binds => [
    //Injetando dependencia da Classe Controller
    Bind((i) => HomeController()), 
    Bind((i) => ListController()),
    Bind<ISearchRepository>((i) => SearchRepository()),
    Bind((i) => MySearchController(i())),
  ];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute("/details", module: DetailsModule()),
    ModuleRoute("/add_to_list", module: AddToListModule(), transition: TransitionType.downToUp, duration: const Duration(milliseconds: 380)),
    ChildRoute('/', child: (context, args) => const HomePage()),
  ];
}