// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../domain/services/user_auth_service.dart' as _i3;
import '../util/log_service.dart' as _i4;

const String _dev = 'dev';
const String _test = 'test';
const String _prod = 'prod';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.AuthService>(() => _i3.AuthService());
    gh.factory<_i4.LogService>(
      () => _i4.LogServiceDev(),
      registerFor: {
        _dev,
        _test,
      },
    );
    gh.factory<_i4.LogService>(
      () => _i4.LogServiceProd(),
      registerFor: {_prod},
    );
    return this;
  }
}
