import 'package:bhc_mobile_app/assets/app_colors.dart';
import 'package:bhc_mobile_app/assets/app_sizes.dart';
import 'package:bhc_mobile_app/assets/text_styles.dart';
import 'package:bhc_mobile_app/features/ui/nav_bar.dart';
import 'package:bhc_mobile_app/features/ui/pages/auth_pages/otp_page/cubit/otp_page_cubit.dart';
import 'package:bhc_mobile_app/features/ui/widgets/app_bar.dart';
import 'package:bhc_mobile_app/features/ui/widgets/custom_buttons/filled_custom_button.dart';
import 'package:bhc_mobile_app/util/enums.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

part 'package:bhc_mobile_app/features/ui/pages/auth_pages/otp_page/otp_page_widgets.dart';

class OtpPage extends StatelessWidget {
  OtpPage({super.key});

  static const routeName = '/otpPage';

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        label: 'We sent OTP to your email',
        labelStyle: AppTextStyles.s24w400,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: Sizes.p16),
        child: Column(
          children: [
            _PageTitle(),
            gapH48,
            _PinInputRow(),
            gapH32,
            // BlocSelector<OtpPageCubit, OtpPageState, bool>(
            //   selector: (state) =>
            //       state.whenVerifyState(BaseBlocStates.loading),
            //   builder: (context, state) {
            //     return state
            //         ? const LoadingIndicator()
            //         : const SizedBox.shrink();
            //   },
            // ),
            spacer,
            _SendCodeButton(),
            gapH32
          ],
        ),
      ),
    );
  }
}
