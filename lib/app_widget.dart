import 'package:anime_lists/shared/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Animes Lists',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.backgroundColor),
        useMaterial3: true,
        textTheme: const TextTheme(
          labelMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          titleSmall: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w300),
          titleMedium: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold)
          ),
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}