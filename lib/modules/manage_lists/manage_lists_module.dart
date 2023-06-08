import 'package:anime_lists/modules/manage_lists/pages/manage_lists_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ManageListsModule extends Module{

  @override
  List<Bind> get binds => [

  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const ManageListsPage())
  ];
}