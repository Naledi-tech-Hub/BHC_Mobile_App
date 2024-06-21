import 'package:bhc_mobile_app/features/ui/widgets/widget_wrapper_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bhc_mobile_app/assets/app_colors.dart';
import 'package:bhc_mobile_app/assets/app_sizes.dart';
import 'package:bhc_mobile_app/assets/asset_paths.dart';
import 'package:bhc_mobile_app/util/consts.dart';

class CustomCheckBox extends StatelessWidget {
  final bool value;
  final void Function() onChanged;

  const CustomCheckBox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: AnimatedContainer(
        height: 20,
        width: 20,
        duration: duration_500ms,
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.blue,
            width: 2,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          color: value ? AppColors.blue : AppColors.white,
        ),
        alignment: Alignment.center,
        child: value ? SvgPicture.asset(IconAssetsPaths.check) : null,
      ),
    );
  }
}

class FavouriteButton extends StatelessWidget {
  const FavouriteButton({
    super.key,
    required this.onPressed,
    this.inAppBar = false,
  });

  final bool inAppBar;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return WidgetButton(
      onPressed: onPressed,
      child: SvgPicture.asset(
        IconAssetsPaths.favEmpty,
        height: inAppBar ? Sizes.p40 : Sizes.p24,
        colorFilter: ColorFilter.mode(
          inAppBar ? AppColors.black : AppColors.white,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}

class CustomRadioButton extends StatelessWidget {
  final bool value;
  final void Function() onChanged;

  const CustomRadioButton({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: AnimatedContainer(
        height: 20,
        width: 20,
        duration: duration_500ms,
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.blue,
            strokeAlign: BorderSide.strokeAlignInside,
            width: value ? 2 : 2,
          ),
          color: value ? AppColors.blue : AppColors.white,
        ),
      ),
    );
  }
}
