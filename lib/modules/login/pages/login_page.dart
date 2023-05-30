import 'package:anime_lists/modules/login/widgets/google_button.dart';
import 'package:anime_lists/shared/utilities/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginPage extends StatelessWidget{
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            color: MyColors.backgroundColor,
          ),
          Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  OrientationLayoutBuilder(
                    portrait: (context) => const Image(image: AssetImage('assets/images/capa_login.png')),
                    landscape: (context) => const Expanded(child: Image(image: AssetImage('assets/images/capa_login_landscape.png'))),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: orientation == Orientation.portrait ? MainAxisAlignment.center : MainAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: orientation == Orientation.portrait ? MainAxisAlignment.end : MainAxisAlignment.center,
                    children: [
                      Text(
                        'Suas listas de animes',
                        style: theme.textTheme.titleMedium,
                      ),
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
                      GoogleButton(),
                      OrientationLayoutBuilder(
                        portrait: (context) => SizedBox(height: 15.screenHeight),
                        landscape: (context) => const SizedBox(width: 0),
                      ),
                    ],
                  ),
                  OrientationLayoutBuilder(
                    portrait: (context) => const SizedBox(height: 0),
                    landscape: (context) => SizedBox(width: 25.screenWidth),
                  ),
                ],
              ),
            ],
          ),
        ],
      )
    );
  }
}