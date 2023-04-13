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
                  InkWell(
                    onTap: (){},
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(25),
                        ),
                        border: Border.all(color: Colors.white.withOpacity(0.7)),
                        boxShadow: [
                          BoxShadow(
                            color: MyColors.primaryColor.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 50,
                            offset: const Offset(30, 10),
                          ),
                          BoxShadow(
                            color: MyColors.accentColor.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 50,
                            offset: const Offset(-30, -10),
                          )
                        ]
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
                ],
              )
          ),

        ],
      )
    );
  }
}