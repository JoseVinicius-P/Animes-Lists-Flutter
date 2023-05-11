import 'package:anime_lists/modules/home/home_module.dart';
import 'package:anime_lists/modules/login/services/authentication_service.dart';
import 'package:anime_lists/modules/login/interfaces/i_authentication_service.dart';
import 'package:anime_lists/modules/login/controllers/login_controller.dart';
import 'package:anime_lists/modules/login/pages/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

//Modulo responsavel pelo login
class LoginModule extends Module{

  @override
  List<Bind> get binds => [
    Bind<IAuthenticationService>((i) => AuthenticationService()),
    Bind((i) => LoginController(i())),
  ];

  @override
  List<ModularRoute> get routes => [
    //Rota raiz automática
    ChildRoute('/', child: (context, args) => const LoginPage()),
    //Inicia o modulo Home
    ModuleRoute('/home', module: HomeModule()),
  ];
}