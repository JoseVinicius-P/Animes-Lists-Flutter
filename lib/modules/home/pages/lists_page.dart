import 'package:anime_lists/shared/utilities/my_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ListsPage extends StatefulWidget {
  const ListsPage({Key? key}) : super(key: key);

  @override
  State<ListsPage> createState() => _ListsPageState();
}

class _ListsPageState extends State<ListsPage> {

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Stack(
      children: [
        Container(
          width: double.infinity,
          color: MyColors.backgroundColor,
        ),
        SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(30),
                            ),
                            border: Border.all(
                              width: 1,
                              style: BorderStyle.solid,
                              color: Colors.transparent,
                            ),
                            gradient: const LinearGradient(
                              colors: [
                                MyColors.primaryColor,
                                MyColors.accentColor,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0.0, 1.0],
                              tileMode: TileMode.clamp,
                            ),
                              boxShadow: [
                                BoxShadow(
                                  color: MyColors.primaryColor.withOpacity(0.4),
                                  spreadRadius: 1,
                                  blurRadius: 20,
                                  offset: const Offset(-5, -5),
                                ),
                                BoxShadow(
                                  color: MyColors.accentColor.withOpacity(0.4),
                                  spreadRadius: 1,
                                  blurRadius: 20,
                                  offset: const Offset(5, 5),
                                )
                              ]
                          ),
                          child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: FirebaseAuth.instance.currentUser?.photoURL ?? '',
                          ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Bem vindo',
                              style: theme.textTheme.titleSmall,
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              FirebaseAuth.instance.currentUser?.displayName ?? '',
                              style: theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    ExpansionPanelListExample(),
                    /*Row(
                      children: [
                        Text(
                          'Segunda',
                          style: theme.textTheme.labelSmall,
                        ),
                        const SizedBox(width: 5),
                        Icon(Icons.sort, color: Colors.white.withOpacity(0.1)),
                      ],
                    ),*/
                    /*Icon(
                      Icons.playlist_remove_rounded,
                      color: Colors.white.withOpacity(0.5),
                      size: 35,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Você ainda não tem nenhuma lista!',
                          style: theme.textTheme.titleSmall!.copyWith(fontSize: 18, color: Colors.white.withOpacity(0.5)),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),*/
                  ],
                ),
              ),
            )
        )
      ],
    );
  }
}

// stores ExpansionPanel state information
class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}

class ExpansionPanelListExample extends StatefulWidget {
  const ExpansionPanelListExample({super.key});

  @override
  State<ExpansionPanelListExample> createState() =>
      _ExpansionPanelListExampleState();
}

class _ExpansionPanelListExampleState extends State<ExpansionPanelListExample> {
  final List<Item> _data = generateItems(8);

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
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          backgroundColor: Colors.transparent,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Row(
              children: [
                Text(
                  'Segunda',
                  style: theme.textTheme.labelSmall,
                ),
                const SizedBox(width: 5),
                Icon(Icons.sort, color: Colors.white.withOpacity(0.1)),
              ],
            );ListTile(
              title: Text(item.headerValue),
            );
          },
          body: AnimeItemHorizontalResumed(),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

class AnimeItemHorizontalResumed extends StatelessWidget {
  const AnimeItemHorizontalResumed({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return InkWell(
      onTap: (){},
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            child: CachedNetworkImage(
              imageUrl: 'https:\/\/cdn.myanimelist.net\/images\/anime\/1286\/99889l.jpg',
              width: 46,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10,),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(
              'Kimetsu no Yaiba',
              style: theme.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
              textAlign: TextAlign.start,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
              Text(
                '2019',
                style: theme.textTheme.labelSmall!.copyWith(color: Colors.white.withOpacity(0.4), fontSize: 16),
                textAlign: TextAlign.start,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            ],
          )
        ],
      ),
    );
  }
}
