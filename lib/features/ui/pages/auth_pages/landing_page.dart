import 'package:bhc_mobile_app/features/ui/pages/auth_pages/create_account_page/create_account_page.dart';
import 'package:bhc_mobile_app/features/ui/pages/auth_pages/login_page/login_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bhc_mobile_app/assets/app_colors.dart';
import 'package:bhc_mobile_app/assets/app_sizes.dart';
import 'package:bhc_mobile_app/assets/asset_paths.dart';
import 'package:bhc_mobile_app/assets/text_styles.dart';
import 'package:bhc_mobile_app/features/ui/widgets/custom_buttons/filled_custom_button.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  static const routeName = 'landingPage';

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(top: Sizes.p200, child: Image.asset(ImageAssetPaths.bg)),
          Padding(
            padding: const EdgeInsets.all(Sizes.p24),
            child: Column(
              children: [
                gapH72,
                SvgPicture.asset(
                  IconAssetsPaths.appLogo, color: AppColors.brand,),
                gapH12,
                Text(
                  'landing.future'.tr(),
                  style:
                  AppTextStyles.s24w700.apply(color: AppColors.brand),
                ),
                spacer,
                FilledCustomButton(
                  buttonColor:AppColors.lightBlue,
                  textColor: AppColors.brand,
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, CreateAccountPage.routeName);
                  },
                  textKey: 'landing.create',
                ),
                gapH16,
                FilledCustomButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      LoginPage.routeName,
                    );
                  },
                  textKey: 'landing.login',
                ),
                gapH48,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
