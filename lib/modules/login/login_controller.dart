import 'package:anime_lists/modules/login/i_authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginController implements Disposable{
  final IAuthenticationService _auth;
  bool inAuthentication = false;

  LoginController(this._auth);

  @override
  void dispose() {

  }

  Future<UserCredential> signInWithGoogle() async{
    inAuthentication = true;
    return await _auth.signInWithGoogle();
  }

  bool isUserLoggedIn(){
    return _auth.isUserLoggedIn();
  }

  void toHomeModule(){
    if(isUserLoggedIn()) {
      Modular.to.navigate('/home/');
    }
    inAuthentication = false;
  }

}