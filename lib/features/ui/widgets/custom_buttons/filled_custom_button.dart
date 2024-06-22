import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:bhc_mobile_app/assets/app_colors.dart';
import 'package:bhc_mobile_app/assets/app_sizes.dart';

import '../loading_indicator.dart';
import 'custom_button.dart';

class FilledCustomButton extends CustomButton {
  const FilledCustomButton({
    required super.onPressed,
    super.textColor = AppColors.white,
    super.inActiveTextColor = AppColors.white,
    super.buttonColor = AppColors.brand,
    super.inActiveButtonColor = AppColors.brandInActive,
    super.textKey,
    super.child,
    super.padding,
    super.isLoading,
    super.isActive,
    super.textStyle,
    super.key,
    super.height,
    super.width,
    super.alignment,
    this.border,
  });

  const FilledCustomButton.secondary({
    required super.onPressed,
    super.textKey,
    super.child,
    super.padding,
    super.isLoading,
    super.isActive,
    super.textStyle,
    super.key,
    super.height,
    super.width,
    super.alignment,
    this.border,
  }) : super(
          textColor: AppColors.black,
          inActiveTextColor: AppColors.grey01,
          buttonColor: AppColors.white,
          inActiveButtonColor: AppColors.whiteInActive,
        );

  const FilledCustomButton.childSize({
    required super.onPressed,
    super.textKey,
    super.child,
    super.padding,
    super.isLoading,
    super.isActive,
    super.textStyle,
    super.key,
    super.height = null,
    super.width = null,
    super.alignment = null,
    this.border,
  }) : super(
          textColor: AppColors.white,
          buttonColor: AppColors.blue,
          inActiveTextColor: AppColors.secondary5,
          inActiveButtonColor: AppColors.secondary4,
        );

  const FilledCustomButton.childSizeSecondary({
    required super.onPressed,
    super.textKey,
    super.child,
    super.padding,
    super.isLoading,
    super.isActive,
    super.textStyle,
    super.key,
    super.height = null,
    super.width = null,
    super.alignment = null,
    this.border,
  }) : super(
          textColor: AppColors.brand,
          inActiveTextColor: AppColors.secondary4,
          buttonColor: AppColors.brand15,
          inActiveButtonColor: AppColors.secondary6,
        );

  FilledCustomButton.outlined({
    required super.onPressed,
    super.textKey,
    super.child,
    super.padding,
    super.isLoading,
    super.isActive,
    super.textStyle,
    super.key,
    super.height,
    super.width,
    super.alignment,
  })  : border = Border.all(
          color: isLoading || !isActive ? AppColors.secondary4 : AppColors.blue,
        ),
        super(
          textColor: AppColors.blue,
          buttonColor: AppColors.white,
          inActiveTextColor: AppColors.secondary5,
          inActiveButtonColor: AppColors.secondary4,
        );

  final Border? border;

  bool get isInActive => isLoading || !isActive;

  @override
  Widget build(BuildContext context) {
    final button = CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: isInActive ? null : onPressed,
      child: Container(
        height: height,
        width: width,
        alignment: alignment,
        padding: padding ?? EdgeInsets.zero,
        decoration: BoxDecoration(
          border: border,
          color: isInActive ? inActiveButtonColor : buttonColor,
          borderRadius: BorderRadius.circular(Sizes.p999),
        ),
        child: isLoading
            ? LoadingIndicator(color: textColor)
            : child ??
                Text(
                  textKey!.tr(),
                  style: textStyle.copyWith(
                    color: isInActive ? inActiveTextColor : textColor,
                  ),
                ),
      ),
    );
    return button;
  }
}
