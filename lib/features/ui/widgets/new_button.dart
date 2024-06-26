import 'package:bhc_mobile_app/assets/app_colors.dart';
import 'package:bhc_mobile_app/features/ui/widgets/widget_wrapper_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../assets/text_styles.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({
    super.key,
    required this.iconPath,
    this.color = AppColors.white,
    required this.text,
    required this.onPressed,
    this.textColor = AppColors.black,
  });

  final String iconPath;
  final Color color;
  final Color textColor;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return WidgetButton(
      onPressed: onPressed,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 56,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                text,
                style: AppTextStyles.s16w400.apply(color: textColor),
              ),
            ),
          ),
          Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            child: SvgPicture.asset(
              iconPath,
              fit: BoxFit.scaleDown,
              color: textColor,
            ),
          )
        ],
      ),
    );
  }
}
