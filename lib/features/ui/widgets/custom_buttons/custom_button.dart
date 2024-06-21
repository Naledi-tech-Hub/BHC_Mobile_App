import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../assets/text_styles.dart';

const double _baseButtonWidth = double.maxFinite;
const double _baseButtonHeight = 56;

abstract class CustomButton extends StatelessWidget {
  final String? textKey;
  final Widget? child;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  final bool isLoading;
  final bool isActive;
  final TextStyle textStyle;
  final Color buttonColor;
  final Color inActiveButtonColor;
  final Color textColor;
  final Color inActiveTextColor;
  final double? width;
  final double? height;
  final Alignment? alignment;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.textColor,
    required this.buttonColor,
    required this.inActiveButtonColor,
    required this.inActiveTextColor,
    this.textKey,
    this.child,
    this.padding,
    this.isLoading = false,
    this.isActive = true,
    this.textStyle = AppTextStyles.s16w400,
    this.height = _baseButtonHeight,
    this.width = _baseButtonWidth,
    this.alignment = Alignment.center,
  }) : assert(textKey != null || child != null);

  @override
  Widget build(BuildContext context);
}
