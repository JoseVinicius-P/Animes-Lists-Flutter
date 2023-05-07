import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthenticationService{
  Future<UserCredential> signInWithGoogle();
  bool isUserLoggedIn();
}