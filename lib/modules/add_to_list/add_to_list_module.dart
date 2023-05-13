import 'package:anime_lists/modules/add_to_list/interfaces/i_list_model.dart';
import 'package:anime_lists/modules/add_to_list/interfaces/i_list_service.dart';
import 'package:anime_lists/modules/add_to_list/models/list_model.dart';
import 'package:anime_lists/modules/add_to_list/pages/add_to_list_page.dart';
import 'package:anime_lists/modules/add_to_list/controllers/add_to_list_controller.dart';
import 'package:anime_lists/modules/add_to_list/services/list_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddToListModule extends Module{

  @override
  List<Bind> get binds => [
    Bind.factory<IListModel>((i) => ListModel.empty()),
    Bind<IListService>((i) => ListService()),
    Bind((i) => AddToListController(i())),

  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => AddToListPage(anime: args.data)),
  ];
}