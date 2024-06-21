import 'package:bhc_mobile_app/di/injector.dart';
import 'package:bhc_mobile_app/features/ui/nav_bar.dart';
import 'package:bhc_mobile_app/features/ui/pages/auth_pages/create_account_page/create_account_page.dart';
import 'package:bhc_mobile_app/features/ui/pages/auth_pages/landing_page.dart';
import 'package:bhc_mobile_app/features/ui/pages/auth_pages/login_page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  AppRouter._();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavBar.routeName:
        return MaterialPageRoute(
          builder: (context) {
            return const NavBar();
          },
          settings: settings,
        );

      case LandingPage.routeName:
        return _NewRoute(const LandingPage(), settings: settings);

      case CreateAccountPage.routeName:
        return _NewRoute(
          const CreateAccountPage(),
          settings: settings,
        );

      case LoginPage.routeName:
        return _NewRoute(
          const LoginPage(),
          settings: settings,
        );

      // case VerifyEmailPage.routeName:
      //   return _NewRoute(
      //     const VerifyEmailPage(),
      //     settings: settings,
      //     param1: settings.arguments,
      //   );

      default:
        return _NewRoute(
          const Material(
            child: Center(
              child: Text("Invalid Route"),
            ),
          ),
        );
    }
  }
}

class _NewRoute extends MaterialPageRoute {
  final Widget child;

  _NewRoute(this.child, {super.settings}) : super(builder: (context) => child);
}

class _NewRouteWithBloc<T extends BlocBase> extends MaterialPageRoute {
  _NewRouteWithBloc(
    this.child, {
    this.lazy,
    super.settings,
    dynamic param1,
    dynamic param2,
  }) : super(
          builder: (context) => BlocProvider(
            create: (context) => getIt.get<T>(
              param1: param1,
              param2: param2,
            ),
            lazy: lazy ?? true,
            child: child,
          ),
        );

  final Widget child;
  final bool? lazy;
}
