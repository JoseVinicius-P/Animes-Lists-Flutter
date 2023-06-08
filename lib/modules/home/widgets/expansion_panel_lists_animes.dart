import 'package:anime_lists/modules/home/controllers/lists_controller.dart';
import 'package:anime_lists/modules/home/interfaces/i_list_expanded_item.dart';
import 'package:anime_lists/modules/home/widgets/anime_item_horizontal_resumed.dart';
import 'package:anime_lists/shared/interfaces/i_list_model.dart';
import 'package:anime_lists/shared/utilities/my_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shimmer/shimmer.dart';

class ExpansionPanelListsAnimes extends StatefulWidget {
  const ExpansionPanelListsAnimes({super.key, required this.lists});

  @override
  State<ExpansionPanelListsAnimes> createState() =>
      _ExpansionPanelListsAnimesState();

  final List<IListModel> lists;
}

class _ExpansionPanelListsAnimesState extends State<ExpansionPanelListsAnimes> {
  late List<IListExpandedItem> _itens;
  var listController = Modular.get<ListController>();

  @override
  void initState() {
    _itens = listController.generateItems(widget.lists);
    super.initState();
  }

  void atualizarItens(){
    _itens = listController.generateItems(widget.lists);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    atualizarItens();
    return _buildPanel(theme);
  }

  Widget _buildPanel(ThemeData theme) {
    return ExpansionPanelList(
      elevation: 0,
      dividerColor: Colors.transparent,
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
          backgroundColor: Colors.transparent,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Row(
              children: [
                Text(
                  item.list.name,
                  style: theme.textTheme.labelSmall!.copyWith(fontSize: 20),
                ),
                const SizedBox(width: 5),
                Icon(Icons.sort, color: Colors.white.withOpacity(0.1)),
              ],
            );
          },
          body: StreamBuilder<QuerySnapshot>(
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
                return Shimmer.fromColors(
                  baseColor: Colors.grey.shade900.withOpacity(0.5),
                  highlightColor: MyColors.backgroundColor,
                  enabled: true,
                  child:  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: MyColors.backgroundColor,
                    ),
                    child: Text(
                      "Minha lista",
                      style: theme.textTheme.labelSmall!.copyWith(fontSize: 20),
                    ),
                  ),
                );
              }
              if(snapshot.data != null && snapshot.data!.docs.isNotEmpty){
                return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    // Define a altura do espaço entre os itens
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 10);
                    },
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
                        child: AnimeItemHorizontalResumed(anime: anime),
                      );
                    }
                );
              }else{
                return const SizedBox();
              }
            },
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}