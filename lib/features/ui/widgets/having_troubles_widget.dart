import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:bhc_mobile_app/assets/app_colors.dart';
import 'package:bhc_mobile_app/assets/app_sizes.dart';
import 'package:bhc_mobile_app/assets/text_styles.dart';
import 'package:bhc_mobile_app/domain/services/email_service.dart';

class HavingTroublesWidget extends StatelessWidget {
  const HavingTroublesWidget({
    super.key,
    required this.textKey,
    this.preButtonTextKey,
    this.hasSupport = false,
  });

  final bool hasSupport;
  final String textKey;
  final String? preButtonTextKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$textKey.troubles'.tr(),
          textAlign: TextAlign.center,
          style: AppTextStyles.s14w400.apply(color: AppColors.secondary2),
        ),
        if (hasSupport) ...[
          gapH4,
          Text(
            'personal.support'.tr(),
            style: AppTextStyles.s14w400.apply(color: AppColors.secondary2),
          ),
        ],
        ContactText(
          emailSubjectKey: textKey,
          preButtonTextKey: preButtonTextKey,
        )
      ],
    );
  }
}

class ContactText extends StatefulWidget {
  const ContactText({
    super.key,
    required this.emailSubjectKey,
    this.preButtonTextKey,
    this.style = AppTextStyles.s14w400,
  });

  final String emailSubjectKey;
  final String? preButtonTextKey;
  final TextStyle style;

  @override
  State<ContactText> createState() => _ContactTextState();
}

class _ContactTextState extends State<ContactText> {
  late final TapGestureRecognizer recognizer;
  bool isPressed = false;

  @override
  void initState() {
    super.initState();
    recognizer = TapGestureRecognizer()
      ..onTapDown = (details) {
        isPressed = true;
        setState(() {});
      }
      ..onTapUp = (details) {
        EmailService().sendEmail('${widget.emailSubjectKey}.troublesText'.tr());
        isPressed = false;
        setState(() {});
      };
  }

  @override
  void dispose() {
    recognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: '${(widget.preButtonTextKey ?? 'profile.contact').tr()} ',
        style: widget.style.apply(color: AppColors.secondary2),
        children: [
          TextSpan(
            text: 'profile.support'.tr(),
            recognizer: recognizer,
            style: AppTextStyles.s14w500.apply(
              color: isPressed ? AppColors.blueInactive : AppColors.blue,
              decoration: TextDecoration.underline,
              decorationColor:
                  isPressed ? AppColors.blueInactive : AppColors.blue,
            ),
          ),
        ],
      ),
      style: widget.style,
      textAlign: TextAlign.center,
    );
  }
}
