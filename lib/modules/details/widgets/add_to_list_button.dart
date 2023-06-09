import 'package:anime_lists/shared/utilities/my_colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AddToListButton extends StatelessWidget {
  final Function onTap;

  const AddToListButton({
    super.key, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var buttonWidth = 55.sw.roundToDouble();

    return InkWell(
      onTap: () => onTap(),
      child: Container(
        height: 50,
        width: buttonWidth,
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
                  Expanded(
                    child: AutoSizeText(
                      'Adicionar a uma lista',
                      style: theme.textTheme.labelMedium,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
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