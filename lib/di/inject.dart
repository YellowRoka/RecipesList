
/*
  1 flutter pub run build_runner watch
  2 import generated inject.config.dart
  3 call $initGetIt() and give it the unique global GetIt

  regist  my class
  with: @singleton or @lazySingleton or @injectable(== factory registration)
  if we want to regist the parent class then annotate with InitGetIt() and use AS in parameter, where we give the type of the parent class

  the dependencies declared in the construct, filed inicialization, 
*/

import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'inject.config.dart';

final getIt = GetIt.instance;

@injectableInit
FutureOr configureDependencies() async {
  return $initGetIt(
    getIt,
    //environmentFilter: NoEnvOrContains( kIsWeb ? 'web' : 'notWeb' ),
  );
}
