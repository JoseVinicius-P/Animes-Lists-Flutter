import 'package:anime_lists/shared/utilities/my_colors.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/login/');

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Animes Lists',
      theme: ThemeData(
        splashFactory: InkRipple.splashFactory,
        splashColor: Color(0x40CCCCCC).withOpacity(0.1),
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.backgroundColor),
        useMaterial3: true,
        textTheme: const TextTheme(
          //Botão
          labelMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          //Titulo fino sem negrito
          titleSmall: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w300),
          //titulo bold com negrito
          titleMedium: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          //texto normal
          labelSmall: TextStyle(fontSize: 18, color: MyColors.textColor, fontWeight: FontWeight.normal)
          ),
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}