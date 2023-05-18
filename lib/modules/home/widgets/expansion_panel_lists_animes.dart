import 'package:anime_lists/modules/home/controllers/lists_controller.dart';
import 'package:anime_lists/modules/home/models/list_expanded_item.dart';
import 'package:anime_lists/modules/home/widgets/anime_item_horizontal_resumed.dart';
import 'package:anime_lists/shared/interfaces/i_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ExpansionPanelListsAnimes extends StatefulWidget {
  const ExpansionPanelListsAnimes({super.key, required this.lists});

  @override
  State<ExpansionPanelListsAnimes> createState() =>
      _ExpansionPanelListsAnimesState();

  final List<IListModel> lists;
}

class _ExpansionPanelListsAnimesState extends State<ExpansionPanelListsAnimes> {
  late List<ListExpandedItem> _itens;
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
        listController.fetchAnimes(_itens[index].list.id);
        /*if(!_itens[index].isAnimesLoad){
          _itens[index].setListAnime(listController.fetchAnimes(_itens[index].list.id));
        }*/
      },
      children: _itens.map<ExpansionPanel>((ListExpandedItem item) {
        return ExpansionPanel(
          backgroundColor: Colors.transparent,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Row(
              children: [
                Text(
                  item.list.name,
                  style: theme.textTheme.labelSmall,
                ),
                const SizedBox(width: 5),
                Icon(Icons.sort, color: Colors.white.withOpacity(0.1)),
              ],
            );
          },
          body: AnimeItemHorizontalResumed(),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}