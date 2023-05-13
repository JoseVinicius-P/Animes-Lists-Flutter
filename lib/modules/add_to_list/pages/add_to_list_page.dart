import 'package:anime_lists/modules/add_to_list/controllers/add_to_list_controller.dart';
import 'package:anime_lists/modules/add_to_list/interfaces/i_list_model.dart';
import 'package:anime_lists/modules/add_to_list/widgets/alert_dialog_add_to_list.dart';
import 'package:anime_lists/shared/interfaces/i_anime_model.dart';
import 'package:anime_lists/shared/utilities/my_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shimmer/shimmer.dart';

class AddToListPage extends StatefulWidget {
  final IAnimeModel anime;

  const AddToListPage({Key? key, required this.anime}) : super(key: key);

  @override
  State<AddToListPage> createState() => _AddToListPageState();
}

class _AddToListPageState extends State<AddToListPage> {
  String? _selectedOption = "Segunda";
  List<String> _options = ['Segunda', 'Terça', 'Quarta'];
  final addToListController = Modular.get<AddToListController>();
  late Future<List<IListModel>> futureListModel;
  var overlayColor = MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return Colors.white.withOpacity(0.1);
      }
      return Colors.transparent;
    },
  );

  @override
  void initState() {
    super.initState();
    futureListModel = addToListController.fetchLists();
  }

  Future<void> _showMyDialog() async {
    String newList = await showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.4),
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialogAddToList(textController: addToListController.textController);
      },
    ) as String;

    if(_options.length < 10){
      setState(() {
        _options.add(newList);
      });
    }
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, right: 15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(3.0),
                    child: LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints constraints) {
                        return CachedNetworkImage(
                            fit: BoxFit.cover,
                            placeholder: (context, url) {
                              return Shimmer.fromColors(
                                baseColor: Colors.grey.shade900.withOpacity(
                                    0.5),
                                highlightColor: MyColors.backgroundColor,
                                enabled: true,
                                child: Container(
                                  width: constraints.maxHeight/1.5,
                                  height: constraints.maxHeight,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(3.0)
                                    ),
                                    color: MyColors.backgroundColor,
                                  ),
                                ),
                              );
                            },
                            imageUrl: widget.anime.main_picture
                        );
                      }
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        forceMaterialTransparency: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Em qual lista vamos salvar?",
              style: theme.textTheme.titleSmall,
              textAlign: TextAlign.center,
            ),
          ],
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
              padding: const EdgeInsets.only(top: 15.0, left: 15.0),
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: _options.length,
                    itemBuilder: (context, index){
                      return RadioListTile(
                        activeColor: MyColors.primaryColor,
                        title: Text(
                          _options[index],
                          style: theme.textTheme.labelSmall,
                        ),
                        value: _options[index],
                        groupValue: _selectedOption,
                        onChanged: (value) {
                          setState(() {
                            _selectedOption = value;
                          });
                        },
                      );
                    }
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () => _showMyDialog(),
                        style: ButtonStyle(
                          overlayColor: overlayColor,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Criar uma nova lista",
                              style: theme.textTheme.titleSmall?.copyWith(color: Colors.white.withOpacity(0.5), fontSize: 17)
                            ),
                            const SizedBox(width: 10,),
                            Icon(Icons.playlist_add_rounded, color: Colors.white.withOpacity(0.5)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 70),
                  InkWell(
                    borderRadius: BorderRadius.circular(25),
                    //Se a authenticação estiver sendo feita o botão não funcionará
                    onTap: (){},
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(25),
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
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: MyColors.primaryColor.withOpacity(0.2),
                              spreadRadius: 0.1,
                              blurRadius: 15,
                              offset: const Offset(-5, -5),
                            ),
                            BoxShadow(
                              color: MyColors.accentColor.withOpacity(0.2),
                              spreadRadius: 0.1,
                              blurRadius: 15,
                              offset: const Offset(5, 5),
                            )
                          ]
                      ),
                      child: SizedBox.expand(
                        child: Container(
                          decoration: BoxDecoration(
                            color: MyColors.backgroundColor.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Salvar',
                                style: theme.textTheme.labelMedium?.copyWith(fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ]
      ),
    );
  }
}
