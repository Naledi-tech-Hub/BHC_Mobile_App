import 'package:bhc_mobile_app/assets/app_theme.dart';
import 'package:bhc_mobile_app/assets/asset_paths.dart';
import 'package:bhc_mobile_app/features/ui/nav_bar.dart';
import 'package:bhc_mobile_app/features/ui/pages/auth_pages/create_account_page/create_account_page.dart';
import 'package:bhc_mobile_app/features/ui/pages/auth_pages/landing_page.dart';
import 'package:bhc_mobile_app/features/ui/pages/auth_pages/login_page/login_page.dart';
import 'package:bhc_mobile_app/features/ui/pages/auth_pages/otp_page/otp_page.dart';
import 'package:bhc_mobile_app/features/ui/routing/app_router.dart';
import 'package:bhc_mobile_app/util/consts.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BHCMobileApp extends StatelessWidget {
  const BHCMobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: supportedLocales,
      fallbackLocale: supportedLocales.first,
      useOnlyLangCode: true,
      path: 'assets/lang',
      child: Builder(builder: (context) {
        return MaterialApp(
          title: 'BHC Mobile',
          debugShowCheckedModeBanner: false,
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          theme: appTheme(context),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: LandingPage.routeName,
        );
      }),
    );
  }
}
