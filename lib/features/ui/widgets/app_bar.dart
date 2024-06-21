import 'package:flutter/material.dart';
import 'package:bhc_mobile_app/assets/app_sizes.dart';
import 'package:bhc_mobile_app/features/ui/widgets/widget_wrapper_button.dart';

class CustomAppBar extends AppBar {
  final String? label;
  final TextStyle? labelStyle;
  final Widget? center;
  final double? height;
  final Widget? action;
  final bool implyLeading;
  final bool hasBottomRadius;
  final double? titleSpace;

  CustomAppBar({
    super.key,
    super.bottom,
    super.centerTitle = true,
    super.leading,
    super.forceMaterialTransparency,
    super.backgroundColor,
    this.implyLeading = true,
    this.hasBottomRadius = true,
    this.action,
    this.label,
    this.height,
    this.center,
    this.titleSpace,
    this.labelStyle,
  }) : super(
          //leading: CustomTapLeading(onPressed: () {}),
          shape: hasBottomRadius
              ? const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(Sizes.p16),
                  ),
                )
              : null,
          automaticallyImplyLeading: implyLeading,
          titleSpacing: implyLeading ? -10 : titleSpace,
          surfaceTintColor: Colors.transparent,
          toolbarHeight: height,
          actions: action != null ? [action, gapW16] : null,
          title: center == null && label == null
              ? null
              : center ??
                  Text(
                    label!,
                    style: labelStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
        );
}

class CustomTapLeading extends StatelessWidget {
  const CustomTapLeading({
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return WidgetButton(
      onPressed: onPressed,
      child: const Icon(Icons.arrow_back),
    );
  }
}
