import 'package:anime_lists/modules/login/widgets/google_button.dart';
import 'package:anime_lists/shared/utilities/my_colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginPage extends StatelessWidget{
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {

    Widget getScaffold(bool isPortrait, BuildContext context){
      var theme = Theme.of(context);
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
                      Container(
                        child: isPortrait ?
                        const Image(image: AssetImage('assets/images/capa_login.png')) :
                        const Expanded(child: Image(image: AssetImage('assets/images/capa_login_landscape.png'))),
                      ),
                    ],
                  ),
                  SafeArea(
                    child: Row(
                      mainAxisAlignment: isPortrait ? MainAxisAlignment.center : MainAxisAlignment.end,
                      children: [
                        Flexible(
                          child: Column(
                            mainAxisAlignment: isPortrait ? MainAxisAlignment.end : MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                                    color: MyColors.backgroundColor.withOpacity(0.8)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: AutoSizeText(
                                    'Suas listas de animes',
                                    style: theme.textTheme.titleMedium!.copyWith(fontSize: 8.sw.roundToDouble()),
                                    maxFontSize: 8.sw.roundToDouble(),
                                    minFontSize: 4.sw.roundToDouble(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                                    color: MyColors.backgroundColor.withOpacity(0.8)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 3.0, bottom: 5.0, left: 5.0),
                                  child: SizedBox(
                                    width: 40.sw.roundToDouble(),
                                    child: AutoSizeText(
                                      'Crie e gerencie listas com seus animes',
                                      maxLines: 2,
                                      softWrap: true,
                                      textAlign: TextAlign.center,
                                      style: theme.textTheme.titleSmall!.copyWith(fontSize: 5.sw.roundToDouble()),
                                      maxFontSize: 5.sw.roundToDouble(),
                                      minFontSize: 2.3.sw.roundToDouble(),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                              GoogleButton(),
                              Container(
                                child: isPortrait ? SizedBox(height: 10.sh) : const SizedBox(),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: isPortrait ? const SizedBox(height: 0) : SizedBox(width: 25.sw),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )
      );
    }

    return OrientationLayoutBuilder(
      portrait: (context) => getScaffold(true, context),
      landscape: (context) => getScaffold(false, context),
    );
  }
}