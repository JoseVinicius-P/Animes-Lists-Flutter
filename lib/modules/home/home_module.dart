import 'package:anime_lists/modules/home/home_controller.dart';
import 'package:anime_lists/modules/home/pages/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module{
  @override
  List<Bind> get binds => [
    //Injetando dependencia da Classe Controller
    Bind((i) => HomeController())
  ];

  @override
  List<ModularRoute> get routes => [
    //Rota Raiz
    ChildRoute('/', child: (context, args) => const HomePage()),
  ];
}