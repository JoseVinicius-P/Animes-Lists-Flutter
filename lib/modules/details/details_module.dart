import 'package:anime_lists/modules/add_to_list/add_to_list_module.dart';
import 'package:anime_lists/modules/details/services/anime_service.dart';
import 'package:anime_lists/modules/details/controllers/details_controller.dart';
import 'package:anime_lists/modules/details/interfaces/i_anime_service.dart';
import 'package:anime_lists/modules/details/pages/details_page.dart';
import 'package:anime_lists/modules/details/repositories/details_repository.dart';
import 'package:anime_lists/modules/details/interfaces/i_details_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DetailsModule extends Module{

  @override
  List<Bind> get binds => [
    Bind<IDetailsRepository>((i) => DetailsRepository()),
    Bind<IAnimeService>((i) => AnimeService()),
    Bind((i) => DetailsController(i(), i())),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => DetailsPage(idAnime: args.data['id'], idList: args.data['idList'],)),
    ModuleRoute("/add_to_list", module: AddToListModule(), transition: TransitionType.downToUp, duration: const Duration(milliseconds: 280)),
  ];
}