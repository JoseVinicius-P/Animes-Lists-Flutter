import 'package:anime_lists/modules/add_to_list/add_to_list_page.dart';
import 'package:anime_lists/modules/details/controllers/details_controller.dart';
import 'package:anime_lists/modules/details/pages/details_page.dart';
import 'package:anime_lists/modules/details/repositories/details_repository.dart';
import 'package:anime_lists/modules/details/interfaces/i_details_repository.dart';
import 'package:anime_lists/modules/login/login_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddToListModule extends Module{

  @override
  List<Bind> get binds => [
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => AddToListPage()),
  ];
}