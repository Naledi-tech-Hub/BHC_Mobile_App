import 'package:flutter_bloc/flutter_bloc.dart';

import 'log_service.dart';

class AppBlocObserver extends BlocObserver {
  final tag = 'BLOC';

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    println(
      'BLOC --- onCreate(${bloc.runtimeType}\nInitial state ${bloc.state})',
      tag: tag,
    );
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    println(
      'BLOC --- onChange(${bloc.runtimeType}\n State $change)',
      tag: tag,
    );
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    println(
      'BLOC --- onError(${bloc.runtimeType}, $error, $stackTrace)',
      tag: tag,
    );
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    println(
      'BLOC --- onClose(${bloc.runtimeType}\nClose state ${bloc.state})',
      tag: tag,
    );
    super.onClose(bloc);
  }
}
