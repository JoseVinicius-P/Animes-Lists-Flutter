import 'package:anime_lists/modules/lists/lists_module.dart';
import 'package:anime_lists/modules/login/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module{

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const LoginPage()),
    ModuleRoute('/lists/', module: ListsModule()),
  ];
}