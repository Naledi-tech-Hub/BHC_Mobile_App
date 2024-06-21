import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bhc_mobile_app/assets/app_colors.dart';
import 'package:bhc_mobile_app/assets/app_sizes.dart';
import 'package:bhc_mobile_app/assets/asset_paths.dart';
import 'package:bhc_mobile_app/assets/text_styles.dart';
import 'package:bhc_mobile_app/features/ui/widgets/widget_wrapper_button.dart';

final _divider = Expanded(
  child: Container(height: 1, color: AppColors.secondary5),
);

class GoogleAppleAuthWidget extends StatelessWidget {
  const GoogleAppleAuthWidget({
    super.key,
    required this.onGoogleButtonPressed,
    required this.onAppleButtonPressed,
  });

  final VoidCallback onGoogleButtonPressed;
  final VoidCallback onAppleButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _divider,
            gapW8,
            Text(
              'createAccount.with'.tr(),
              style: AppTextStyles.s14w400.apply(color: AppColors.secondary3),
            ),
            gapW8,
            _divider,
          ],
        ),
        gapH16,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WidgetButton(
              onPressed: onAppleButtonPressed,
              child: SvgPicture.asset(IconAssetsPaths.appleIcon),
            ),
            gapW16,
            WidgetButton(
              onPressed: onGoogleButtonPressed,
              child: SvgPicture.asset(IconAssetsPaths.googleIcon),
            ),
          ],
        ),
      ],
    );
  }
}
