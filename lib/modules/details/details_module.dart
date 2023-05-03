import 'package:anime_lists/modules/details/details_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DetailsModule extends Module{

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => DetailsPage(id: args.data))
  ];
}