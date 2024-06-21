import 'package:bhc_mobile_app/features/ui/pages/auth_pages/login_page/login_page.dart';
import 'package:bhc_mobile_app/features/ui/pages/auth_pages/otp_page/otp_page.dart';
import 'package:bhc_mobile_app/features/ui/widgets/app_bar.dart';
import 'package:bhc_mobile_app/features/ui/widgets/close_app_observer.dart';
import 'package:bhc_mobile_app/features/ui/widgets/custom_check_box.dart';
import 'package:bhc_mobile_app/features/ui/widgets/google_apple_auth_widget.dart';
import 'package:bhc_mobile_app/features/ui/widgets/widget_wrapper_button.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bhc_mobile_app/assets/app_colors.dart';
import 'package:bhc_mobile_app/assets/app_sizes.dart';
import 'package:bhc_mobile_app/assets/text_styles.dart';
import 'package:bhc_mobile_app/features/ui/widgets/app_bar.dart';
import 'package:bhc_mobile_app/features/ui/widgets/close_app_observer.dart';
import 'package:bhc_mobile_app/features/ui/widgets/custom_buttons/filled_custom_button.dart';
import 'package:bhc_mobile_app/features/ui/widgets/custom_check_box.dart';
import 'package:bhc_mobile_app/features/ui/widgets/custom_text_field.dart';
import 'package:bhc_mobile_app/features/ui/widgets/google_apple_auth_widget.dart';
import 'package:bhc_mobile_app/features/ui/widgets/having_troubles_widget.dart';
import 'package:bhc_mobile_app/features/ui/widgets/inactive_widget.dart';
import 'package:bhc_mobile_app/features/ui/widgets/white_container.dart';
import 'package:bhc_mobile_app/features/ui/widgets/widget_wrapper_button.dart';

// import 'package:bhc_mobile_app/features/ui/navbar/nav_bar.dart';
// import 'package:bhc_mobile_app/features/ui/pages/verify_email_page/verify_email_page.dart';
import 'package:bhc_mobile_app/util/alert_utils.dart';
import 'package:bhc_mobile_app/util/consts.dart';

class CreateAccountPage extends StatelessWidget {
  static const routeName = '/createAccount';

  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CloseAppObserver(
      child: Scaffold(
        floatingActionButton: const _CreateAccountButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar: CustomAppBar(
          label: 'landing.create'.tr(),
          implyLeading: false,
          hasBottomRadius: false,
        ),
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
          flex: 4,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${'createAccount.already'.tr()} ',
                    style: AppTextStyles.s18w500.apply(
                      color: AppColors.secondary3,
                    ),
                  ),
                  WidgetButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, LoginPage.routeName),
                    child: Text(
                      'landing.login'.tr(),
                      style: AppTextStyles.s18w500.apply(
                        color: AppColors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              gapH32,
              EmailField(
                onChanged: (value) {},
                initialValue: 'cubit.state.email',
              ),
              gapH16,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: Sizes.p4),
                    child: CustomCheckBox(
                      value: false,
                      onChanged: () {},
                    ),
                  ),
                  gapW12,
                  const Expanded(child: _TermsAndConditions()),
                ],
              ),
              gapH32,
              InActiveWidget(
                isActive: true,
                child: GoogleAppleAuthWidget(
                  onGoogleButtonPressed: () {},
                  onAppleButtonPressed: () {},
                ),
              ),
              gapH40,
              const HavingTroublesWidget(textKey: 'createAccount'),
              gapH12,
            ],
          ),
        ),
        const Spacer(),
      ],
    );
  }
}

class _CreateAccountButton extends StatelessWidget {
  const _CreateAccountButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.p16,
        vertical: Sizes.p8,
      ),
      child: FilledCustomButton(
        isActive: true,
        isLoading: false,
        onPressed: () => Navigator.pushNamed(context, OtpPage.routeName),
        textKey: 'landing.create',
      ),
    );
  }
}

class _TermsAndConditions extends StatelessWidget {
  const _TermsAndConditions();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          'createAccount.agree'.tr(),
          style: AppTextStyles.s16w500.apply(color: AppColors.secondary2),
        ),
        WidgetButton(
          alignment: Alignment.bottomCenter,
          onPressed: () {},
          //     WebViewService.launchURL(
          //   context: context,
          //   launchUrl: termsOfService,
          // ),
          child: Text(
            'createAccount.terms'.tr(),
            style: AppTextStyles.s16w500,
          ),
        ),
        Text(
          'createAccount.and'.tr(),
          style: AppTextStyles.s16w500.apply(color: AppColors.secondary2),
        ),
        WidgetButton(
          onPressed: () {},
          //     WebViewService.launchURL(
          //   context: context,
          //   launchUrl: privacyPolicyLink,
          // ),
          child: Text(
            'createAccount.policy'.tr(),
            style: AppTextStyles.s16w500,
          ),
        ),
      ],
    );
  }
}
