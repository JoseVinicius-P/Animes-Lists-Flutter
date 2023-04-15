import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeController implements Disposable{

  final pageViewController = PageController();

  @override
  void dispose() {
    pageViewController.dispose();
  }

}