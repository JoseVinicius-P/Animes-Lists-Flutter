import 'package:anime_lists/app_module.dart';
import 'package:anime_lists/app_widget.dart';
import 'package:anime_lists/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_builder/responsive_builder.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ResponsiveApp(
          builder: (context) => ModularApp(module: AppModule(), child: AppWidget())
      )
    );
}