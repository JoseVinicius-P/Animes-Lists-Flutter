import 'package:anime_lists/modules/login/login_controller.dart';
import 'package:anime_lists/shared/utilities/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GoogleButton extends StatelessWidget {

  GoogleButton({
    super.key,
  });

  final loginController = Modular.get<LoginController>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return InkWell(
      borderRadius: BorderRadius.circular(25),
      //Se a authenticação estiver sendo feita o botão não funcionará
      onTap: loginController.inAuthentication ? null : () async {
        await loginController.signInWithGoogle();
        loginController.toHomeModule();
      },
      child: Container(
        height: 50,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(25),
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
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage('assets/images/icon_google.png'),
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Entrar com o google',
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