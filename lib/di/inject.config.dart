// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../bloc/state_manager_bloc.dart' as _i6;
import '../cloud_functions/web_service.dart' as _i5;
import 'environment.dart' as _i3;
import 'module/dio_module.dart' as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final dioModule = _$DioModule();
  gh.singleton<_i3.AppEnvironment>(_i3.ProdEnvironment());
  gh.singleton<_i4.Dio>(dioModule.dio(get<_i3.AppEnvironment>()));
  gh.singleton<_i5.WebService>(_i5.WebService(get<_i4.Dio>()));
  gh.factory<_i6.StateManagerBloc>(
      () => _i6.StateManagerBloc(get<_i5.WebService>()));
  return get;
}

class _$DioModule extends _i7.DioModule {}
