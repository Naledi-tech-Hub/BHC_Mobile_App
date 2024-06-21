import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart'
    show StringTranslateExtension;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bhc_mobile_app/assets/app_colors.dart';
import 'package:bhc_mobile_app/assets/app_sizes.dart';
import 'package:bhc_mobile_app/assets/text_styles.dart';
import 'package:bhc_mobile_app/features/ui/widgets/custom_text_field.dart';
import 'package:bhc_mobile_app/features/ui/widgets/loading_indicator.dart';

import '../../../assets/asset_paths.dart';
import 'widget_wrapper_button.dart';

class CustomDropDown<T> extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.items,
    required this.onChanged,
    this.value,
    this.bgColor = AppColors.white,
    this.borderColor = AppColors.black,
    this.height,
    this.customButtonPadding,
    this.style = AppTextStyles.s18w500,
    this.dropdownKey,
    this.dropdownWidth,
    this.customButtonTextKey,
  });

  final List<CustomDropDownItem<T>> items;
  final ValueChanged<T?>? onChanged;
  final T? value;
  final double? height, dropdownWidth, customButtonPadding;
  final String? customButtonTextKey;
  final Color bgColor, borderColor;
  final TextStyle style;
  final GlobalKey<DropdownButton2State>? dropdownKey;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<T>(
        key: dropdownKey,
        value: value,
        onChanged: onChanged,
        items: items,
        style: style.apply(
          color: borderColor,
          overflow: TextOverflow.ellipsis,
        ),
        customButton: customButtonTextKey == null
            ? null
            : Padding(
                padding: customButtonPadding == null
                    ? EdgeInsets.zero
                    : EdgeInsets.all(customButtonPadding!),
                child: Row(
                  children: [
                    Text(customButtonTextKey!.tr()),
                    gapW8,
                    Icon(
                      CupertinoIcons.chevron_down,
                      color: borderColor,
                    ),
                  ],
                ),
              ),
        buttonStyleData: ButtonStyleData(height: height),
        dropdownStyleData: DropdownStyleData(
          width: dropdownWidth,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(Sizes.p12),
          ),
        ),
        iconStyleData: IconStyleData(
          icon: Icon(
            CupertinoIcons.chevron_down,
            color: borderColor,
          ),
          openMenuIcon: Icon(
            CupertinoIcons.chevron_up,
            color: borderColor,
          ),
        ),
      ),
    );
  }
}

class CustomDropDownFormField<T> extends CustomDropDown<T> {
  const CustomDropDownFormField({
    super.key,
    super.value,
    super.bgColor,
    required super.items,
    required super.onChanged,
    this.hint,
    this.onPressedCancelButton,
  });

  final String? hint;
  final VoidCallback? onPressedCancelButton;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      items: items,
      isExpanded: true,
      menuMaxHeight: Sizes.p300,
      onChanged: onChanged,
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      dropdownColor: AppColors.white,
      selectedItemBuilder: items.every((e) => e.selectedWidget != null)
          ? (context) {
              return items
                  .map((CustomDropDownItem e) => e.selectedWidget!)
                  .toList();
            }
          : null,
      icon: items.isEmpty
          ? const LoadingIndicator(
              androidScaleFactor: 0.4,
              iosScaleFactor: 0.8,
            )
          : const Icon(
              CupertinoIcons.chevron_down,
              color: AppColors.secondary3,
              size: 18,
            ),
      borderRadius: BorderRadius.circular(Sizes.p12),
      style: AppTextStyles.s16w400.apply(color: AppColors.black),
      decoration: InputDecoration(
        prefixIconConstraints: const BoxConstraints(minWidth: Sizes.zero),
        labelText: hint,
        prefixIcon: onPressedCancelButton != null && value != null
            ? WidgetButton(
                onPressed: onPressedCancelButton,
                padding: const EdgeInsets.only(left: Sizes.p8, right: Sizes.p4),
                child: const Icon(
                  Icons.close,
                  size: 22,
                  color: AppColors.secondary5,
                ),
              )
            : null,
        contentPadding: const EdgeInsets.only(
          left: Sizes.p16,
          right: Sizes.p14,
          top: Sizes.p12,
          bottom: Sizes.p12,
        ),
      ),
    );
  }
}

class CustomDropDownItem<T> extends DropdownMenuItem<T> {
  final String? text;
  final Widget? dropdownWidget;
  final Widget? selectedWidget;
  final Color textColor;

  CustomDropDownItem({
    this.text,
    this.dropdownWidget,
    this.textColor = AppColors.black,
    this.selectedWidget,
    super.key,
    super.alignment,
    super.onTap,
    super.value,
  })  : assert(text != null || dropdownWidget != null),
        super(child: dropdownWidget ?? Text(text!));
}

class CustomDropdownSelectedItem extends StatelessWidget {
  const CustomDropdownSelectedItem({
    super.key,
    required this.text,
    required this.onPressedCancelButton,
  });

  final String text;
  final VoidCallback? onPressedCancelButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondary6,
        borderRadius: BorderRadius.circular(Sizes.p4),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.p4,
        vertical: Sizes.p1,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          gapW2,
          Flexible(
            child: Text(
              text,
              style: AppTextStyles.s16w400,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          GestureDetector(
            onTap: onPressedCancelButton,
            child: SvgPicture.asset(
              IconAssetsPaths.cross,
              height: 16,
              colorFilter: const ColorFilter.mode(
                AppColors.secondary3,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
