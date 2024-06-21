import 'dart:developer';

import 'package:bhc_mobile_app/di/injector.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

void initErrorHandler() {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    println("$details", tag: 'Flutter Error');
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    println("Error $error \n Stack $stack", tag: 'Platform error');
    return true;
  };
}

void println(String text, {String? tag}) {
  getIt.get<LogService>()._log(text, tag);
}

@Injectable(as: LogService, env: [Environment.dev, Environment.test])
class LogServiceDev extends LogService {
  LogServiceDev() : super(Environment.dev);
}

@Injectable(as: LogService, env: [Environment.prod])
class LogServiceProd extends LogService {
  LogServiceProd() : super(Environment.prod);
}

abstract class LogService {
  final String _env;

  LogService(@factoryParam this._env);

  void _log(String text, [String? tag]) {
    if (_env != Environment.prod) {
      tag == null ? log(text) : log("$tag => $text");
    }
  }
}
