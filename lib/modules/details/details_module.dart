import 'package:anime_lists/modules/details/details_controller.dart';
import 'package:anime_lists/modules/details/details_page.dart';
import 'package:anime_lists/modules/details/details_repository.dart';
import 'package:anime_lists/modules/details/i_details_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DetailsModule extends Module{

  @override
  List<Bind> get binds => [
    Bind<IDetailsRepository>((i) => DetailsRepository()),
    Bind((i) => DetailsController(i())),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => DetailsPage(id: args.data))
  ];
}