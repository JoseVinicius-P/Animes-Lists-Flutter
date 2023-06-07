import 'dart:async';
import 'package:anime_lists/shared/services/authentication_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/home/');

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) {
    return !AuthenticationService.isUserLoggedIn();
  }
}