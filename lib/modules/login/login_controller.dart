import 'package:anime_lists/modules/login/i_authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginController implements Disposable{
  final IAuthenticationService _auth;

  LoginController(this._auth);

  @override
  void dispose() {

  }

  Future<UserCredential> signInWithGoogle() async{
    return await _auth.signInWithGoogle();
  }

  bool isUserLoggedIn(){
    return _auth.isUserLoggedIn();
  }
}