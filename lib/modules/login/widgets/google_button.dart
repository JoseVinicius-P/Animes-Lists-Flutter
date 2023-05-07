import 'package:anime_lists/shared/utilities/my_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    super.key,
  });

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void toHomeModule(){
    if(isUserLoggedIn()) {
      Modular.to.navigate('/home/');
    }
  }

  bool isUserLoggedIn(){
    if(FirebaseAuth.instance.currentUser != null){
      return true;
    }else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return InkWell(
      onTap: () async {
        await signInWithGoogle();
        toHomeModule();
      },
      child: Container(
        height: 50,
        width: 200,
        decoration: BoxDecoration(
          borderRadius:BorderRadius.all(
            Radius.circular(25),
          ),
          border: Border.all(
            width: 1,
            style: BorderStyle.solid,
            color: Colors.transparent,
          ),
          gradient: LinearGradient(
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