import 'package:bhc_mobile_app/di/injector.dart';
import 'package:bhc_mobile_app/features/ui/nav_bar.dart';
import 'package:bhc_mobile_app/features/ui/pages/auth_pages/create_account_page/create_account_page.dart';
import 'package:bhc_mobile_app/features/ui/pages/auth_pages/landing_page.dart';
import 'package:bhc_mobile_app/features/ui/pages/auth_pages/login_page/login_page.dart';
import 'package:bhc_mobile_app/features/ui/pages/auth_pages/otp_page/cubit/otp_page_cubit.dart';
import 'package:bhc_mobile_app/features/ui/pages/auth_pages/otp_page/otp_page.dart';
import 'package:bhc_mobile_app/features/ui/pages/house_details_page/house_details_page.dart';
import 'package:bhc_mobile_app/features/ui/pages/houses_page/application_form_page/application_form_page.dart';
import 'package:bhc_mobile_app/features/ui/pages/houses_page/mortgage_page/mortgage_calculator_page.dart';
import 'package:bhc_mobile_app/features/ui/pages/report_page/create_report_page.dart';
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
        return _NewRoute(const CreateAccountPage(), settings: settings);

      case LoginPage.routeName:
        return _NewRoute(const LoginPage(), settings: settings);

      case OtpPage.routeName:
        return _NewRouteWithBloc<OtpPageCubit>(
          OtpPage(),
          settings: settings,
        );
      case HouseDetailsPage.routeName:
        return _NewRouteWithBloc<OtpPageCubit>(
          HouseDetailsPage(),
          settings: settings,
        );

      case ApplicationFormPage.routeName:
        return _NewRoute(const ApplicationFormPage(), settings: settings);
      case CreateReportPage.routeName:
        return _NewRoute(const CreateReportPage(), settings: settings);

      case MortgageCalculatorPage.routeName:
        return ModalBottomSheetRoute(
          settings: settings,
          builder: (BuildContext context) => const MortgageCalculatorPage(),
          isScrollControlled: false,
        );

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
