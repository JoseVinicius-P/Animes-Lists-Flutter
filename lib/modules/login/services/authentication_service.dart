import 'package:anime_lists/modules/login/interfaces/i_authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart' ;
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:universal_io/io.dart';

class AuthenticationService implements IAuthenticationService {

  @override
  Future<UserCredential> signInWithGoogle() async {
    if(kIsWeb){
      // Create a new provider
      GoogleAuthProvider googleProvider = GoogleAuthProvider();

      googleProvider.addScope('https://www.googleapis.com/auth/contacts.readonly');
      googleProvider.setCustomParameters({
        'login_hint': 'user@example.com'
      });

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithPopup(googleProvider);
    }else{
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
  }

  @override
  bool isUserLoggedIn(){
    if(FirebaseAuth.instance.currentUser != null){
      return true;
    }else {
      return false;
    }
  }
}