import 'package:anime_lists/modules/lists/lists_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ListsModule extends Module{
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const ListsPage()),
  ];
}