// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../domain/services/user_auth_service.dart' as _i4;
import '../features/ui/pages/auth_pages/otp_page/cubit/otp_page_cubit.dart'
    as _i3;
import '../util/log_service.dart' as _i5;

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
    gh.factory<_i3.OtpPageCubit>(() => _i3.OtpPageCubit());
    gh.singleton<_i4.AuthService>(() => _i4.AuthService());
    gh.factory<_i5.LogService>(
      () => _i5.LogServiceDev(),
      registerFor: {
        _dev,
        _test,
      },
    );
    gh.factory<_i5.LogService>(
      () => _i5.LogServiceProd(),
      registerFor: {_prod},
    );
    return this;
  }
}
