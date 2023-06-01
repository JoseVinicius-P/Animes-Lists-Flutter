import 'package:anime_lists/modules/login/controllers/login_controller.dart';
import 'package:anime_lists/shared/utilities/my_colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_builder/responsive_builder.dart';

class GoogleButton extends StatelessWidget {

  GoogleButton({
    super.key,
  });

  final loginController = Modular.get<LoginController>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var buttonWidth = 50.sw.roundToDouble();
    var buttonHeight = buttonWidth/4.roundToDouble();

    Widget getGoogleButton(bool isPortrait){
      return InkWell(
        borderRadius: BorderRadius.circular(buttonHeight),
        //Se a authenticação estiver sendo feita o botão não funcionará
        onTap: loginController.inAuthentication ? null : () async {
          await loginController.signInWithGoogle();
          loginController.toHomeModule();
        },
        child: Container(
          height: buttonHeight,
          width: buttonWidth,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(buttonHeight),
              ),
              border: Border.all(
                width: 1,
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
                borderRadius: BorderRadius.circular(buttonHeight),
              ),
              child: Padding(
                padding: EdgeInsets.all(buttonHeight/5.roundToDouble()),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage('assets/images/icon_google.png'),
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: AutoSizeText(
                        maxLines: 1,
                        minFontSize: 2.5.sw.roundToDouble(),
                        'Entrar com o google',
                        style: theme.textTheme.labelMedium!.copyWith(fontSize: 5.sw.roundToDouble()),
                        textAlign: TextAlign.center,
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

    return OrientationLayoutBuilder(
      portrait: (context) => getGoogleButton(true),
      landscape: (context) => getGoogleButton(false),
    );
  }
}