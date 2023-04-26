import 'package:anime_lists/modules/home/home_controller.dart';
import 'package:anime_lists/modules/home/lists_controller.dart';
import 'package:anime_lists/modules/home/pages/home_page.dart';
import 'package:anime_lists/modules/details/details_module.dart';
import 'package:anime_lists/modules/home/search_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module{

  @override
  List<Bind> get binds => [
    //Injetando dependencia da Classe Controller
    Bind((i) => HomeController()), 
    Bind((i) => ListController()),
    Bind((i) => SearchController())
  ];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute("./details", module: DetailsModule()),
    ChildRoute('/', child: (context, args) => const HomePage()),
  ];
}