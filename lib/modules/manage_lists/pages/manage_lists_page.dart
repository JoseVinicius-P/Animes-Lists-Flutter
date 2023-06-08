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
  List<IListModel>? lists;
  late Future<List<IListModel>> futureListModel;
  final manageListController = Modular.get<ManageListsController>();


  @override
  void initState() {
    super.initState();
    futureListModel = manageListController.fetchLists();
    futureListModel.then((value) {
      lists = value;
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
          "Gerenciar Listas",
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
                        for (int i = 0; i < lists!.length; i += 1)
                          Row(
                            key: Key('$i'),
                            children: [
                              Text(
                                snapshot.data![i].name,
                                style: theme.textTheme.labelSmall!.copyWith(fontSize: 20),
                              ),
                              const SizedBox(width: 5),
                              Icon(Icons.sort, color: Colors.white.withOpacity(0.1)),
                              const SizedBox(height: 40),
                            ],
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
                        const SizedBox(height: 15),
                      ],
                    );
                  }else{
                    return SizedBox();
                  }
                },
              ),
              /*StreamBuilder<QuerySnapshot>(
                stream: manageListController.fetchLists(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text(
                      'Algo saiu errado ):',
                      style: theme.textTheme.titleSmall!.copyWith(fontSize: 18, color: Colors.white.withOpacity(0.5)),
                      textAlign: TextAlign.center,
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SizedBox(); //SHimmer
                  }
                  if(snapshot.data != null && snapshot.data!.docs.isNotEmpty){
                    lists = manageListController.parseToListOfListModel(snapshot.data!.docs.cast());
                    return ReorderableListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        for (int i = 0; i < lists.length; i += 1)
                          Row(
                            key: Key('$i'),
                            children: [
                              Text(
                                lists[i].name,
                                style: theme.textTheme.labelSmall!.copyWith(fontSize: 20),
                              ),
                              const SizedBox(width: 5),
                              Icon(Icons.sort, color: Colors.white.withOpacity(0.1)),
                              const SizedBox(height: 40),
                            ],
                          ),
                      ],
                      onReorder: (int oldIndex, int newIndex) {
                        setState(() {
                          if (newIndex > oldIndex) {
                            newIndex -= 1;
                          }
                          final item = lists.removeAt(oldIndex);
                          lists.insert(newIndex, item);
                        });
                      },
                    );
                  }else{
                    return const SizedBox();
                  }
                },
              ),*/
            ),
          ),
        ],
      ),
    );
  }
}
