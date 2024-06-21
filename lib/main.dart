import 'package:bhc_mobile_app/di/injector.dart';
import 'package:bhc_mobile_app/domain/services/user_auth_service.dart';
import 'package:bhc_mobile_app/features/bhc_mobile_app.dart';
import 'package:bhc_mobile_app/util/bloc_observer.dart';
import 'package:bhc_mobile_app/util/log_service.dart';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  injectDependencies(env: Environment.dev);
  initErrorHandler();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  final noAccessToken = await getIt.get<AuthService>().noAccessToken;
  // String initialRoute =
  //     noAccessToken ? LandingPage.routeName : NavBar.routeName;
  runApp(const BHCMobileApp());
}
