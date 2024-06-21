part of 'package:bhc_mobile_app/features/ui/pages/auth_pages/otp_page/otp_page.dart';

class _PageTitle extends StatelessWidget {
  const _PageTitle();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<OtpPageCubit, OtpPageState, bool>(
      selector: (state) => state.isOtpValid,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'otp.${state ? 'valid' : "expired"}'.tr(),
              style: AppTextStyles.s18w400.copyWith(color: AppColors.grey01),
            ),
            if (state)
              BlocSelector<OtpPageCubit, OtpPageState, String>(
                selector: (state) => state.otpValidTime,
                builder: (context, state) {
                  return Text(
                    state,
                    style: AppTextStyles.s18w400,
                  );
                },
              ),
          ],
        );
      },
    );
  }
}

class _PinInputRow extends StatelessWidget {
  const _PinInputRow();

  static const defaultPinTheme = PinTheme(
    width: Sizes.p48,
    height: Sizes.p60,
    textStyle: AppTextStyles.s48w400,
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: AppColors.grey01)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final textController =
        context.findAncestorWidgetOfExactType<OtpPage>()?._controller;
    final cubit = context.read<OtpPageCubit>();
    return BlocConsumer<OtpPageCubit, OtpPageState>(
      listenWhen: (previous, current) {
        return previous.optVerifyState != current.optVerifyState ||
            previous.isOtpValid != current.isOtpValid;
      },
      listener: (context, state) async {
        if (!state.isOtpValid) {
          textController?.clear();
        }
        if (state.whenVerifyState(BaseBlocStates.success)) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            NavBar.routeName,
            (settings) => false,
          );
        }
      },
      buildWhen: (previous, current) {
        return previous.optVerifyState != current.optVerifyState ||
            previous.isOtpValid != current.isOtpValid;
      },
      builder: (context, state) {
        return Pinput(
          controller: textController,
          defaultPinTheme: defaultPinTheme,
          length: 4,
          readOnly: !state.isOtpValid,
          cursor: Container(
            height: Sizes.p32,
            width: Sizes.p3,
            decoration: BoxDecoration(
              color: AppColors.white50,
              borderRadius: BorderRadius.circular(Sizes.p20),
            ),
          ),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          keyboardType: TextInputType.number,
          forceErrorState: state.whenVerifyState(BaseBlocStates.error),
          errorText: 'otp.incorrect'.tr(),
          errorBuilder: (errorText, code) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.only(top: Sizes.p8),
                child: Text(
                  errorText ?? '',
                  style: AppTextStyles.s14w400.copyWith(color: AppColors.red),
                ),
              ),
            );
          },
          pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
          onCompleted: cubit.verifyOtp,
        );
      },
    );
  }
}

class _SendCodeButton extends StatelessWidget {
  const _SendCodeButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtpPageCubit, OtpPageState>(
      buildWhen: (previous, current) {
        return previous.otpRequestState != current.otpRequestState ||
            previous.canSendNewCode != current.canSendNewCode;
      },
      builder: (context, state) {
        return FilledCustomButton(
          onPressed: () {
            context.read<OtpPageCubit>().requestOtp();
            context
                .findAncestorWidgetOfExactType<OtpPage>()
                ?._controller
                .clear();
          },
          isLoading: state.whenRequestState(BaseBlocStates.loading),
          isActive: state.canSendNewCode,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'otp.sendCode'.tr(),
                style: AppTextStyles.s18w400.copyWith(
                  color: state.canSendNewCode
                      ? AppColors.blue
                      : AppColors.blueTransparent,
                ),
              ),
              if (!state.canSendNewCode)
                BlocSelector<OtpPageCubit, OtpPageState, String>(
                  selector: (state) => state.newCodeTime,
                  builder: (context, state) {
                    return Text(
                      state,
                      style: AppTextStyles.s18w400
                          .copyWith(color: AppColors.black),
                    );
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
