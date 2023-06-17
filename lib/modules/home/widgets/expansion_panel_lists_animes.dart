import 'package:anime_lists/modules/home/controllers/lists_controller.dart';
import 'package:anime_lists/modules/home/interfaces/i_list_expanded_item.dart';
import 'package:anime_lists/modules/home/widgets/anime_item_horizontal_resumed.dart';
import 'package:anime_lists/modules/home/widgets/shimmer_animes_list.dart';
import 'package:anime_lists/shared/interfaces/i_list_model.dart';
import 'package:anime_lists/shared/utilities/my_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ExpansionPanelListsAnimes extends StatefulWidget {
  const ExpansionPanelListsAnimes({super.key, required this.lists});

  @override
  State<ExpansionPanelListsAnimes> createState() =>
      _ExpansionPanelListsAnimesState();

  final List<IListModel> lists;
}

class _ExpansionPanelListsAnimesState extends State<ExpansionPanelListsAnimes> {
  late List<IListExpandedItem> _itens;
  late List<IListModel> oldLists;
  var listController = Modular.get<ListController>();

  @override
  void initState() {
    oldLists = List<IListModel>.from(widget.lists);
    _itens = listController.generateItems(widget.lists);
    super.initState();
  }

  void atualizarItens(){
    if(!listEquals(oldLists, widget.lists)){
      _itens = listController.generateItems(widget.lists);
      oldLists = widget.lists;
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    atualizarItens();
    return OrientationLayoutBuilder(
      portrait: (context) => _buildPanel(true, theme),
      landscape: (context) => _buildPanel(false, theme),
    );
  }

  Widget _buildPanel(bool isPortrait, ThemeData theme) {
    return ExpansionPanelList(
      expandedHeaderPadding: EdgeInsets.all(0),
      elevation: 2,
      dividerColor: Colors.grey.withOpacity(0.09),
      expandIconColor: Colors.white.withOpacity(0.5),
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _itens[index].isExpanded = !isExpanded;
        });
        if(!isExpanded && !_itens[index].isAnimesLoad){
          _itens[index].setStreamListAnime(listController.fetchAnimes(_itens[index].list.id));
        }
      },
      children: _itens.map<ExpansionPanel>((IListExpandedItem item) {
        return ExpansionPanel(
          backgroundColor: MyColors.backgroundColorLight,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    item.list.name,
                    style: theme.textTheme.labelSmall!.copyWith(fontSize: 20),
                  ),
                  const SizedBox(width: 5),
                  Icon(Icons.sort, color: Colors.white.withOpacity(0.1)),
                ],
              ),
            );
          },
          body: Padding(
            padding: const EdgeInsets.only(bottom: 15.0, right: 8.0, left: 8.0),
            child: StreamBuilder<QuerySnapshot>(
              stream: item.getStreamListAnime(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text(
                    'Algo saiu errado ):',
                    style: theme.textTheme.titleSmall!.copyWith(fontSize: 18, color: Colors.white.withOpacity(0.5)),
                    textAlign: TextAlign.center,
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return ShimmerAnimesList(qtAnimes: item.list.qt_animes, isPortrait: isPortrait);
                }
                if(snapshot.data != null && snapshot.data!.docs.isNotEmpty){
                  return LayoutBuilder(
                    builder: (context, constraints){
                      return GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: isPortrait ? 1 : 2,
                              mainAxisSpacing: 10,
                              childAspectRatio: isPortrait ? constraints.maxWidth/70 : (constraints.maxWidth/2)/70,
                          ),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index){
                            var anime = listController.parseToAnimeModel(snapshot.data!.docs[index] as QueryDocumentSnapshot<Map<String, dynamic>>);
                            return GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onLongPress: (){
                                Clipboard.setData(ClipboardData(text: anime.title));
                                Fluttertoast.showToast(
                                    msg: "Copiado",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.SNACKBAR,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: MyColors.primaryColor.withOpacity(0.2),
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                              },
                              onTap: () => listController.toDetailsModule(anime.id, item.list),
                              child: AnimeItemHorizontalResumed(anime: anime, list: item.list),
                            );
                          }
                      );
                    }
                  );
                }else{
                  return const SizedBox();
                }
              },
            ),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}