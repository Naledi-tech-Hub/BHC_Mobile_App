import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bhc_mobile_app/assets/app_colors.dart';
import 'package:bhc_mobile_app/assets/app_sizes.dart';
import 'package:bhc_mobile_app/assets/text_styles.dart';
import 'package:bhc_mobile_app/features/ui/widgets/app_bar.dart';
import 'package:bhc_mobile_app/features/ui/widgets/close_app_observer.dart';
import 'package:bhc_mobile_app/features/ui/widgets/custom_buttons/filled_custom_button.dart';
import 'package:bhc_mobile_app/features/ui/widgets/custom_text_field.dart';
import 'package:bhc_mobile_app/features/ui/widgets/google_apple_auth_widget.dart';
import 'package:bhc_mobile_app/features/ui/widgets/having_troubles_widget.dart';
import 'package:bhc_mobile_app/features/ui/widgets/white_container.dart';
import 'package:bhc_mobile_app/features/ui/widgets/widget_wrapper_button.dart';
// import 'package:bhc_mobile_app/features/ui/navbar/nav_bar.dart';
import 'package:bhc_mobile_app/features/ui/pages/auth_pages/create_account_page/create_account_page.dart';
// import 'package:bhc_mobile_app/features/ui/pages/auth_pages/verify_email_page/verify_email_page.dart';
import 'package:bhc_mobile_app/util/alert_utils.dart';
import 'package:bhc_mobile_app/util/consts.dart';
import 'package:bhc_mobile_app/util/enums.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CloseAppObserver(
      child: Scaffold(
        appBar: CustomAppBar(
          label: 'landing.login'.tr(),
          implyLeading: false,
          hasBottomRadius: false,
        ),
        floatingActionButton: const _LoginButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: const CustomScrollView(
          physics: ClampingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: _Body(),
            )
          ],
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: WhiteContainer(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.p18),
            bottomOnly: true,
            child: Column(
              children: [
                Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.end,
                  children: [
                    Text(
                      '${'createAccount.notRegistered'.tr()} ',
                      style: AppTextStyles.s18w500
                          .apply(color: AppColors.secondary3),
                    ),
                    gapW4,
                    WidgetButton(
                      onPressed: () => Navigator.pushNamed(
                          context, CreateAccountPage.routeName),
                      child: Text(
                        'landing.create'.tr(),
                        style: AppTextStyles.s18w500
                            .copyWith(color: AppColors.blue),
                      ),
                    ),
                  ],
                ),
                gapH32,
                EmailField(
                  onChanged: (val) {},
                  initialValue: 'loginCubit.state.email',
                ),
                gapH32,
                GoogleAppleAuthWidget(
                  onGoogleButtonPressed: () {},
                  onAppleButtonPressed: () {},
                ),
                gapH32,
                const HavingTroublesWidget(textKey: 'login'),
                gapH12,
              ],
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              gapH32,
              Wrap(
                alignment: WrapAlignment.center,
                runSpacing: Sizes.p6,
                children: [
                  Text(
                    'login.continue'.tr(),
                    style: AppTextStyles.s12w500
                        .apply(color: AppColors.secondary2),
                  ),
                  WidgetButton(
                    onPressed: () {},
                    //     WebViewService.launchURL(
                    //   context: context,
                    //   launchUrl: termsOfService,
                    // ),
                    child: Text(
                      'createAccount.terms'.tr(),
                      style: AppTextStyles.s12w500,
                    ),
                  ),
                  Text(
                    'createAccount.and'.tr(),
                    style: AppTextStyles.s12w500.apply(
                      color: AppColors.secondary2,
                    ),
                  ),
                  WidgetButton(
                    onPressed: () {},
                    //     WebViewService.launchURL(
                    //   context: context,
                    //   launchUrl: privacyPolicyLink,
                    // ),
                    child: Text(
                      'createAccount.policy'.tr(),
                      style: AppTextStyles.s12w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.secondary7,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.p16,
          vertical: Sizes.p8,
        ),
        child: FilledCustomButton(
          isActive: true,
          isLoading: false,
          onPressed: () {},
          textKey: 'landing.login',
        ),
      ),
    );
  }
}
