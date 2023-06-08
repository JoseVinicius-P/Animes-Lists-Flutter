import 'package:anime_lists/modules/add_to_list/widgets/save_button.dart';
import 'package:anime_lists/modules/manage_lists/controllers/manage_lists_controller.dart';
import 'package:anime_lists/shared/interfaces/i_list_model.dart';
import 'package:anime_lists/shared/utilities/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ManageListsPage extends StatefulWidget {
  const ManageListsPage({Key? key}) : super(key: key);

  @override
  State<ManageListsPage> createState() => _ManageListsPageState();
}

class _ManageListsPageState extends State<ManageListsPage> {
  late Future<List<IListModel>> futureListModel;
  late List<IListModel> oldOrder;
  final manageListController = Modular.get<ManageListsController>();


  @override
  void initState() {
    super.initState();
    futureListModel = manageListController.fetchLists();
    futureListModel.then((value){
      oldOrder = List<IListModel>.from(value);
    });
  }
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Modular.to.pop(),
            icon: const Icon(Icons.close, color: Colors.white)
        ),
        forceMaterialTransparency: true,
        title: Text(
          "Ordenar listas",
          style: theme.textTheme.titleSmall,
          textAlign: TextAlign.center,
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            color: MyColors.backgroundColor,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: FutureBuilder<List<IListModel>>(
                future: futureListModel,
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    return Column(
                      children: [
                        ReorderableListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          for (int i = 0; i < snapshot.data!.length; i += 1)
                            Container(
                              key: Key('$i'),
                              decoration: const BoxDecoration(
                                color: MyColors.backgroundColor
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.drag_handle_rounded, color: Colors.white.withOpacity(0.5)),
                                  const SizedBox(width: 15),
                                  Text(
                                    snapshot.data![i].name,
                                    style: theme.textTheme.labelSmall!.copyWith(fontSize: 20),
                                  ),
                                  const SizedBox(height: 40),
                                ],
                              ),
                            ),
                        ],
                        onReorder: (int oldIndex, int newIndex) {
                          setState(() {
                            if (newIndex > oldIndex) {
                              newIndex -= 1;
                            }
                            final item = snapshot.data!.removeAt(oldIndex);
                            snapshot.data!.insert(newIndex, item);
                          });
                        },
                      ),
                      const SizedBox(height: 70),
                      SaveButton(onTap: manageListController.savingInProgress ? null : () async {
                        setState(() {
                          manageListController.orderLists(oldOrder, snapshot.data!);
                        });
                      }),
                    ],
                  );
                  }else{
                    return const SizedBox();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
