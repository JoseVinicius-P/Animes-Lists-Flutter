import 'package:anime_lists/modules/details/controllers/details_controller.dart';
import 'package:anime_lists/shared/utilities/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddToListButton extends StatelessWidget {
  final int id;
  final Function onTap;

  const AddToListButton({
    super.key, required this.id, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    /*Future<void> _showMyDialog(int id) async {
      return showDialog<void>(
        context: context,
        barrierColor: Colors.black.withOpacity(0.7),
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialogAddToList(id: id,);
        },
      );
    }*/

    return InkWell(
      onTap: onTap(),
      child: Container(
        height: 50,
        width: 200,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(25),
            ),
            border: Border.all(
              width: 2,
              style: BorderStyle.solid,
              color: Colors.transparent,
            ),
            gradient: const LinearGradient(
              colors: [
                MyColors.primaryColor,
                MyColors.accentColor,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: MyColors.primaryColor.withOpacity(0.2),
                spreadRadius: 0.1,
                blurRadius: 15,
                offset: const Offset(-5, -5),
              ),
              BoxShadow(
                color: MyColors.accentColor.withOpacity(0.2),
                spreadRadius: 0.1,
                blurRadius: 15,
                offset: const Offset(5, 5),
              )
            ]
        ),
        child: SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
              color: MyColors.backgroundColor.withOpacity(0.9),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Adicionar a uma lista',
                    style: theme.textTheme.labelMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*class AlertDialogAddToList extends StatefulWidget {
  final int id;
  const AlertDialogAddToList({
    super.key, required this.id,
  });

  @override
  State<AlertDialogAddToList> createState() => _AlertDialogAddToListState();
}

class _AlertDialogAddToListState extends State<AlertDialogAddToList> {

  @override
  void initState() {
    super.initState();
    //WidgetsBinding.instance.addPostFrameCallback((_) => Modular.to.navigate('./add_to_list/', arguments: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    var theme =  Theme.of(context);
    return AlertDialog(
      backgroundColor: MyColors.backgroundColor,
      title:
          Text(
            'Adicionar em uma lista',
            style: theme.textTheme.labelSmall!.copyWith(color: Colors.white, fontSize:20),
            textAlign: TextAlign.center,
          ),
      content: Row(
        children: [
           RouterOutlet(),
        ],
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
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}*/