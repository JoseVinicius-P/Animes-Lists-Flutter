import 'dart:async';

import 'package:anime_lists/modules/home/controllers/my_search_controller.dart';
import 'package:anime_lists/shared/utilities/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TextFormFieldNeon extends StatefulWidget {
  final Function onTextChange;

  const TextFormFieldNeon({
    super.key,
    required this.onTextChange
  });

  @override
  State<TextFormFieldNeon> createState() => _TextFormFieldNeonState();
}

class _TextFormFieldNeonState extends State<TextFormFieldNeon> {
  final _textEditingController = Modular.get<MySearchController>().textEditingController;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    Timer? delay;


    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
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
            stops: const [0.0, 1.0],
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
        controller: _textEditingController,
        //Chamando função recebida do widget pai para alterar texto
        onChanged: (text){
          delay?.cancel();
          delay = Timer(const Duration(milliseconds: 1000), () {
            if(text.length >= 3){
              widget.onTextChange(text);
            }
          });
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
          suffixIcon: IconButton(
            icon: Icon(Icons.close, color: Colors.white.withOpacity(0.7),),
            onPressed: () => _textEditingController.clear(),
          )
        ),
      ),
    );
  }
}
