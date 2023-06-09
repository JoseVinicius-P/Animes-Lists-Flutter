import 'package:anime_lists/modules/home/controllers/lists_controller.dart';
import 'package:anime_lists/modules/home/widgets/expansion_panel_lists_animes.dart';
import 'package:anime_lists/modules/home/widgets/shimmer_lists.dart';
import 'package:anime_lists/shared/utilities/my_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ListsPage extends StatefulWidget {
  const ListsPage({Key? key}) : super(key: key);

  @override
  State<ListsPage> createState() => _ListsPageState();
}

class _ListsPageState extends State<ListsPage> {
  var listController = Modular.get<ListController>();

  @override
  void initState() {
    super.initState();
  }

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
                        const Spacer(),
                        PopupMenuButton<String>(
                          color: Colors.white.withOpacity(0.8),
                          elevation: 2,
                          // Callback that sets the selected popup menu item.
                          onSelected: (String value) {
                            if(value == 'sair'){
                              listController.signOut();
                            }else if(value == 'gerenciarListas'){
                              listController.toManageListsModule();
                            }
                          },
                          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                            const PopupMenuItem<String>(
                              value: 'gerenciarListas',
                              child: Row(children: [
                                Icon(
                                  Icons.format_list_numbered_rounded,
                                    color: MyColors.backgroundColor
                                ),
                                SizedBox(width: 5),
                                Text("Ordenar listas")
                              ],),
                            ),
                            const PopupMenuItem<String>(
                              value: 'sair',
                              child: Row(children: [
                                Icon(
                                  Icons.logout_rounded,
                                  color: MyColors.backgroundColor
                                ),
                                SizedBox(width: 5),
                                Text("Sair")
                              ],),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    StreamBuilder<QuerySnapshot>(
                      stream: listController.fetchLists(),
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Text(
                            'Algo saiu errado ):',
                            style: theme.textTheme.titleSmall!.copyWith(fontSize: 18, color: Colors.white.withOpacity(0.5)),
                            textAlign: TextAlign.center,
                          );
                        }
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return ShimmerLists();
                        }
                        if(snapshot.data != null && snapshot.data!.docs.isNotEmpty){
                          return ExpansionPanelListsAnimes(lists: listController.parseToListOfListModel(snapshot.data!.docs.cast()));
                        }else{
                          return Column(
                            children: [
                              Icon(
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
                              ),
                            ],
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            )
        )
      ],
    );
  }
}
