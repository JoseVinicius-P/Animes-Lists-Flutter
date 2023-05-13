import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddToListController implements Disposable{
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
  }

}