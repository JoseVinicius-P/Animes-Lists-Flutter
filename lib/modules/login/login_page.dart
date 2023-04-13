import 'package:anime_lists/modules/login/widgets/google_button.dart';
import 'package:anime_lists/shared/my_colors.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget{
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            color: MyColors.backgroundColor,
          ),
          SafeArea(
            child: Column(
                children: [
                  const SizedBox(height: 30),
                  const Image(image: AssetImage('assets/images/capa_login.png')),
                  const SizedBox(height: 30),
                  Text(
                    'Suas listas de animes',
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 200,
                    child: Text(
                      'Crie e gerencie listas com seus animes',
                      maxLines: 2,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const GoogleButton(),
                ],
              )
          ),
        ],
      )
    );
  }
}