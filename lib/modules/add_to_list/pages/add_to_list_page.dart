import 'package:anime_lists/modules/add_to_list/controllers/add_to_list_controller.dart';
import 'package:anime_lists/shared/interfaces/i_list_model.dart';
import 'package:anime_lists/modules/add_to_list/widgets/Icon_anime_image.dart';
import 'package:anime_lists/modules/add_to_list/widgets/alert_dialog_add_to_list.dart';
import 'package:anime_lists/modules/add_to_list/widgets/save_button.dart';
import 'package:anime_lists/shared/interfaces/i_anime_model.dart';
import 'package:anime_lists/shared/utilities/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AddToListPage extends StatefulWidget {
  final IAnimeModel anime;

  const AddToListPage({Key? key, required this.anime}) : super(key: key);

  @override
  State<AddToListPage> createState() => _AddToListPageState();
}

class _AddToListPageState extends State<AddToListPage> {
  late IListModel? _selectedOption;
  late List<IListModel> _options;
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
    futureListModel.then((value) {
      _options = value;
      _selectedOption = _options[0];
    });
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

    addAtOptions(newList);
  }

  void addAtOptions(String newList){
    IListModel listModel = Modular.get<IListModel>();
    listModel.setName(newList);

    if(_options.length < 10){
      for (int i = 0;i < _options.length; i++){
        if(_options[i].id == 'create'){
          _options.removeAt(i);
        }
      }

      setState(() {
        _options.add(listModel);
        _selectedOption = listModel;
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
                  child: IconAnimeImage(imageUrl: widget.anime.main_picture),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  child: SingleChildScrollView(
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: 100.sw.roundToDouble(),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0, left: 15.0),
                        child: FutureBuilder<List<IListModel>>(
                          future: futureListModel,
                          builder: (context, snapshot){
                            if(snapshot.hasData){
                              return Column(
                                children: [
                                  ListView.builder(
                                      physics: const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: _options.length,
                                      itemBuilder: (context, index){
                                        return RadioListTile(
                                          activeColor: MyColors.primaryColor,
                                          title: Text(
                                            _options[index].name,
                                            style: theme.textTheme.labelSmall,
                                          ),
                                          value: _options[index],
                                          groupValue: _selectedOption,
                                          onChanged: addToListController.savingInProgress ? null : (value) {
                                            setState(() {
                                              _selectedOption = value as IListModel?;
                                            });
                                          },
                                        );
                                      }
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    mainAxisAlignment: snapshot.data!.isEmpty ? MainAxisAlignment.center : MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: _options.length < 10 ? TextButton(
                                          onPressed: addToListController.savingInProgress ? null : () => _showMyDialog(),
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
                                        ) :
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                                "Você já tem muitas listas! Max: 10",
                                                style: theme.textTheme.titleSmall?.copyWith(color: Colors.white.withOpacity(0.5), fontSize: 17)
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 70),
                                  SaveButton(onTap: addToListController.savingInProgress ? null : () {
                                    try{
                                      if(_selectedOption != null){
                                        setState(() {
                                          addToListController.saveAnime(_selectedOption!, widget.anime);
                                        });
                                      }
                                    }catch(e){
                                      //selected option nula
                                    }
                                  }),
                                  const SizedBox(height: 30),
                                ],
                              );
                            }else{
                              return SizedBox();
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]
      ),
    );
  }
}