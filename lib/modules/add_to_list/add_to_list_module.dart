import 'package:anime_lists/modules/add_to_list/interfaces/i_anime_service.dart';
import 'package:anime_lists/modules/add_to_list/pages/add_to_list_page.dart';
import 'package:anime_lists/modules/add_to_list/controllers/add_to_list_controller.dart';
import 'package:anime_lists/modules/add_to_list/services/anime_service.dart';
import 'package:anime_lists/shared/services/auth_guard.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddToListModule extends Module{

  @override
  List<Bind> get binds => [
    Bind<IAnimeService>((i) => AnimeService()),
    Bind((i) => AddToListController(i(), i())),

  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => AddToListPage(anime: args.data), guards: [AuthGuard()]),
  ];
}