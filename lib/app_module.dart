import 'package:anime_lists/modules/login/login_module.dart';
import 'package:anime_lists/modules/login/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module{
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/', module: LoginModule()),
  ];
}