import 'package:anime_lists/modules/home/home_module.dart';
import 'package:anime_lists/modules/login/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

//Modulo responsavel pelo login
class LoginModule extends Module{

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    //Rota raiz automática
    ChildRoute('/', child: (context, args) => const LoginPage()),
    //Inicia o modulo Home
    ModuleRoute('/home/', module: HomeModule()),
  ];
}