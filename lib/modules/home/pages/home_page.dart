import 'package:anime_lists/modules/home/controllers/home_controller.dart';
import 'package:anime_lists/modules/home/pages/lists_page.dart';
import 'package:anime_lists/modules/home/pages/search_page.dart';
import 'package:anime_lists/shared/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Este controlador é usado para gerenciar o pageView
  final controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Este page view fica respnsavel por exibir as páginas e possibilitar o slide das páginas
      body: PageView(
        //Controller
        controller: controller.pageViewController,
        children: [
          //Paginas
          ListsPage(),
          SearchPage(),
        ],
      ),
      //Criando o BottomNavigation
      bottomNavigationBar: AnimatedBuilder(
        //Possibilitando a troca da current page usando o controller do PageView
        animation: controller.pageViewController,
        builder: (context, snapshot) {
          return BottomNavigationBar(
            backgroundColor: MyColors.backgroundColor,
            //Definindo atributos e icones não selecionados
            unselectedIconTheme: IconThemeData(
              color: Colors.white.withOpacity(0.3)
            ),
            //Não mostrar texto se item não estiver selecionado
            showUnselectedLabels: false,
            //Definindo item selecionado de acorddo com controlle pageViewCOntroler
            //Está arredondando para par o inteiro mais próximo por conta do slide que o page view permite
            currentIndex: controller.pageViewController.page?.round() ?? 0,
            //Definido cor do item selecionado
            selectedItemColor: Colors.white,
            onTap: (index){
              controller.pageViewController.animateToPage(index, // Índice da página para animar
                  duration: const Duration(milliseconds: 800), // Duração da animação
                  curve: Curves.easeInOutCubicEmphasized, // Curva de animação
              );
            },
            //Criando Itens
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
          );
        }
      ),
    );
  }
}
