import 'package:anime_lists/modules/manage_lists/controllers/manage_lists_controller.dart';
import 'package:anime_lists/modules/manage_lists/interfaces/i_order_lists_service.dart';
import 'package:anime_lists/modules/manage_lists/pages/manage_lists_page.dart';
import 'package:anime_lists/modules/manage_lists/service/order_lists_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ManageListsModule extends Module{

  @override
  List<Bind> get binds => [
    Bind<IOrderListsService>((i) => OrderListService()),
    Bind((i) => ManageListsController(i(), i()))
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const ManageListsPage())
  ];
}