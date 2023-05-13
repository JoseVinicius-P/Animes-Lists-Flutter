import 'package:anime_lists/shared/utilities/my_colors.dart';
import 'package:flutter/material.dart';

class AlertDialogAddToList extends StatelessWidget {
  final textController;

  const AlertDialogAddToList({
    super.key, required this.textController,
  });

  @override
  Widget build(BuildContext context) {
    var theme =  Theme.of(context);
    return AlertDialog(
      backgroundColor: MyColors.backgroundColor,
      title: Text(
        'Qual o nome da nova lista?',
        style: theme.textTheme.titleSmall,
        textAlign: TextAlign.center,
      ),
      content: TextFormField(
        controller: textController,
        //definindo estilo do texto
        style: const TextStyle(
            color: MyColors.textColor,
            fontSize: 15
        ),
        cursorColor: MyColors.textColor,
        //retirando autocorreção de texto
        autocorrect: false,
        decoration: InputDecoration(
          hintText: "Nova lista",
          hintStyle: theme.textTheme.labelSmall!.copyWith(color: MyColors.textColor.withOpacity(0.2), fontSize: 15),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text(
            'Cancelar',
            style: TextStyle(
              color: MyColors.primaryColor,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop(null);
          },
        ),
        TextButton(
          onPressed: (){
            if(textController.text.isNotEmpty && textController.text.trim().isNotEmpty){
              Navigator.of(context).pop(textController.text.trim());
            }
          },
          child: const Text(
            'Criar',
            style: TextStyle(
              color: MyColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}