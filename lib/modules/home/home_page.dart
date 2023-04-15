import 'package:anime_lists/modules/home/lists_page.dart';
import 'package:anime_lists/modules/home/search_page.dart';
import 'package:anime_lists/shared/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final pageViewController = PageController();

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/lists');
    return Scaffold(
      body: PageView(
        controller: pageViewController,
        children: [
          ListsPage(),
          SearchPage(),
        ],
      ),
      bottomNavigationBar: AnimatedBuilder(
        animation: pageViewController,
        builder: (context, snapshot) {
          return BottomNavigationBar(
            backgroundColor: MyColors.backgroundColor,
            unselectedIconTheme: IconThemeData(
              color: Colors.white.withOpacity(0.3)
            ),
            showUnselectedLabels: false,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.format_list_bulleted),
                label: 'Listas',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Pesquisar',
              ),
            ],
            currentIndex: pageViewController.page?.round() ?? 0,
            selectedItemColor: Colors.white,
            onTap: (index){
              pageViewController.jumpToPage(index);
            },
          );
        }
      ),
    );
  }
}
