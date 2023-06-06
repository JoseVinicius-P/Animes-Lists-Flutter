import 'dart:async';
import 'package:anime_lists/shared/services/args_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ParametersGuard extends RouteGuard {
  ParametersGuard() : super(redirectTo: '/home');

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) {
    if(Modular.get<ArgsService>().hasAnime()){
      return true;
    }else{
      return false;
    }
  }
}