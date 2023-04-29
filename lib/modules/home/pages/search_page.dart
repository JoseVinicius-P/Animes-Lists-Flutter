import 'package:anime_lists/modules/home/controllers/my_search_controller.dart';
import 'package:anime_lists/shared/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchController = Modular.get<MySearchController>();

  @override
  void initState() {
    super.initState();
    searchController.getAnime();
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
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pesquisar animes',
                  style: theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      borderRadius:BorderRadius.all(
                        Radius.circular(30),
                      ),
                      border: Border.all(
                        width: 1,
                        style: BorderStyle.solid,
                        color: Colors.transparent,
                      ),
                      gradient: LinearGradient(
                        colors: [
                          MyColors.primaryColor.withOpacity(0.4),
                          MyColors.accentColor.withOpacity(0.4),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: MyColors.primaryColor.withOpacity(0.3),
                          spreadRadius: 0.1,
                          blurRadius: 15,
                          offset: const Offset(-3, -3),
                        ),
                        BoxShadow(
                          color: MyColors.accentColor.withOpacity(0.3),
                          spreadRadius: 0.1,
                          blurRadius: 15,
                          offset: const Offset(3, 3),
                        )
                      ]
                  ),
                  child: TextFormField(
                    //Chamando função recebida do widget pai para alterar texto
                    onChanged: (text) {
                    },
                    //definindo estilo do texto
                    style: const TextStyle(
                      color: MyColors.textColor,
                      fontSize: 15
                    ),
                    cursorColor: MyColors.textColor,
                    //retirando autocorreção de texto
                    autocorrect: false,
                    //definindo estilo do container do textfield
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      //Definindo hint usando varivel da classe personalizada MyStrings
                      hintText: 'Pesquisar animes',
                      hintStyle: theme.textTheme.labelSmall!.copyWith(color: MyColors.textColor.withOpacity(0.2), fontSize: 15),
                      //perimitindo preenchimento do container
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.8),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(24),
                      ),
                      child: Image.network(
                        'https:\/\/cdn.myanimelist.net\/images\/anime\/1286\/99889l.jpg',
                        height: 170,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        height: 170,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Kimetsu no Yaiba',
                                  style: theme.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  '2019',
                                  style: theme.textTheme.labelSmall!.copyWith(color: Colors.white.withOpacity(0.4), fontSize: 16),
                                  textAlign: TextAlign.start,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            Text(
                              'Desde a morte de seu pai, o fardo de sustentar a família caiu sobre os ombros de Tanjirou Kamado. Embora viva empobrecida em uma montanha remota, a família Kamado consegue desfrutar de uma vida relativamente pacífica e feliz. Um dia, Tanjirou decide ir até a aldeia local para ganhar algum dinheiro vendendo carvão. No caminho de volta, a noite cai, forçando Tanjirou a se abrigar na casa de um homem estranho, que o avisa sobre a existência de demônios comedores de carne que espreitam na floresta à noite.\n\nQuando ele finalmente volta para casa, o no dia seguinte, ele se depara com uma visão horrível - toda a sua família foi massacrada. Pior ainda, o único sobrevivente é sua irmã Nezuko, que foi transformada em um demônio sanguinário. Consumido pela raiva e ódio, Tanjirou jura vingar sua família e ficar com seu único irmão restante. Juntamente com o misterioso grupo que se autodenomina Demon Slayer Corps, Tanjirou fará o que for preciso para matar os demônios e proteger os remanescentes da humanidade de sua amada irmã.',
                              style: theme.textTheme.labelSmall!.copyWith(fontSize: 14),
                              textAlign: TextAlign.justify,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              'Finalizada',
                              style: theme.textTheme.labelSmall!.copyWith(fontSize: 14, color: Colors.red.withOpacity(0.4)),
                              textAlign: TextAlign.end,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )

              ],
            ),
          )
        )
      ]
    );
  }
}
