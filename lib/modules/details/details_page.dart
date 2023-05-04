import 'package:anime_lists/shared/utilities/my_colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final int id;

  const DetailsPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
          shadows: [
            BoxShadow(
            color: Colors.black,
            offset: Offset(0, 0),
            blurRadius: 30,
          )
          ]
        ),
        backgroundColor: Colors.transparent,
        forceMaterialTransparency: true,
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            color: MyColors.backgroundColor,
          ),
          Column(
            children: [
              Stack(
                children: [
                  Image.network(
                    'https:\/\/cdn.myanimelist.net\/images\/anime\/1286\/99889l.jpg',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 130,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            MyColors.backgroundColor,
                            Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp,
                        )
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: (MediaQuery.of(context).size.width/2),
                          child: AutoSizeText(
                            'Kimetsu no Yaiba  aaa aaaa',
                            style: theme.textTheme.titleMedium,
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            minFontSize: 22,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '2019',
                          style: theme.textTheme.labelSmall!.copyWith(color: Colors.white.withOpacity(0.2), fontSize: 15),
                          textAlign: TextAlign.left,
                        ),
                        const Spacer(),
                        Icon(
                          Icons.star_rounded,
                          color: Colors.yellow.withOpacity(0.5),
                        ),
                        Text(
                          '5',
                          style: theme.textTheme.labelSmall!.copyWith(color: Colors.white.withOpacity(0.5)),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Ufotable',
                          style: theme.textTheme.labelSmall!.copyWith(color: Colors.white.withOpacity(0.2), fontSize: 15),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Em Kimetsu no Yaiba, Tanjiro, um bondoso jovem que ganha a vida vendendo carvão descobre que sua família foi massacrada por um demônio. E, para piorar, Nezuko, sua irmã mais nova e única sobrevivente, também acabou transformada em um demônio.',
                            style: theme.textTheme.labelSmall!.copyWith(color: Colors.white.withOpacity(0.3), fontSize: 17),
                            textAlign: TextAlign.justify,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 100),
                    InkWell(
                      onTap: () {

                      },
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(25),
                            ),
                            border: Border.all(
                              width: 2,
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
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Adicionar a lista',
                                    style: theme.textTheme.labelMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
