import 'package:flutter/cupertino.dart';

import '../../../assets/app_colors.dart';
import '../../../assets/app_sizes.dart';

class WhiteContainer extends StatelessWidget {
  const WhiteContainer({
    super.key,
    required this.child,
    this.bottomOnly = false,
    this.padding,
  });

  final Widget child;
  final bool bottomOnly;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: bottomOnly
            ? const BorderRadius.vertical(bottom: Radius.circular(Sizes.p16))
            : BorderRadius.circular(Sizes.p16),
        color: AppColors.white,
      ),
      padding: bottomOnly ? padding : const EdgeInsets.all(Sizes.p16),
      child: child,
    );
  }
}
