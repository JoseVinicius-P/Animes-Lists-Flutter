import 'package:anime_lists/shared/my_colors.dart';
import 'package:flutter/material.dart';

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
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.all(
                        Radius.circular(30),
                      ),
                      border: Border.all(
                        width: 2,
                        style: BorderStyle.solid,
                        color: Colors.transparent,
                      ),
                      gradient: LinearGradient(
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
                    borderRadius:BorderRadius.all(
                      Radius.circular(30),
                    ),
                    child: Image.network('https://instagram.fbsb10-1.fna.fbcdn.net/v/t51.2885-19/132937295_136268714829155_3050363562817765117_n.jpg?stp=dst-jpg_s150x150&_nc_ht=instagram.fbsb10-1.fna.fbcdn.net&_nc_cat=111&_nc_ohc=ZyrG9vOrGfUAX9TMjfz&edm=ACWDqb8BAAAA&ccb=7-5&oh=00_AfAvevfpHjzCahDmtzpixDtMNAzpvE1GS6v2lnsVZuT4cQ&oe=64404762&_nc_sid=1527a3')),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bem vindo de volta',
                        style: theme.textTheme.titleSmall,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'José Vinícius',
                        style: theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      )
                    ],
                  ),
                ],
              ),
            )
        )
      ],
    );
  }
}
