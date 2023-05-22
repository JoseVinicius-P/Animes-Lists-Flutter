import 'package:anime_lists/modules/home/controllers/lists_controller.dart';
import 'package:anime_lists/modules/home/interfaces/i_list_expanded_item.dart';
import 'package:anime_lists/modules/home/models/list_expanded_item.dart';
import 'package:anime_lists/modules/home/widgets/anime_item_horizontal_resumed.dart';
import 'package:anime_lists/shared/interfaces/i_anime_model.dart';
import 'package:anime_lists/shared/interfaces/i_list_model.dart';
import 'package:anime_lists/shared/models/anime_model.dart';
import 'package:anime_lists/shared/utilities/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
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
          _itens[index].setListAnime(listController.fetchAnimes(_itens[index].list.id));
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
          body: FutureBuilder<List<IAnimeModel>>(
            future: item.getListAnime(),
            builder: (context, snapshot){
              if(snapshot.hasData){
                return ListView.separated(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  // Define a altura do espaço entre os itens
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 10);
                  },
                  itemBuilder: (context, index){
                    return AnimeItemHorizontalResumed(anime: snapshot.data![index]);
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