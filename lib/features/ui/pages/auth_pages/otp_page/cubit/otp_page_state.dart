part of 'otp_page_cubit.dart';

class OtpPageState {
  final BaseBlocStates otpRequestState;
  final BaseBlocStates optVerifyState;
  final bool canSendNewCode;
  final bool isOtpValid;
  final String newCodeTime;
  final String otpValidTime;

  const OtpPageState({
    this.otpRequestState = BaseBlocStates.initial,
    this.optVerifyState = BaseBlocStates.initial,
    this.canSendNewCode = false,
    this.isOtpValid = true,
    this.newCodeTime = '',
    this.otpValidTime = '',
  });

  bool whenRequestState(BaseBlocStates state) {
    return state == otpRequestState;
  }

  bool whenVerifyState(BaseBlocStates state) {
    return state == optVerifyState;
  }

  OtpPageState copyWith({
    BaseBlocStates? otpRequestState,
    BaseBlocStates? optVerifyState,
    bool? canSendNewCode,
    bool? isOtpValid,
    String? newCodeTime,
    String? otpValidTime,
  }) =>
      OtpPageState(
        otpRequestState: otpRequestState ?? this.otpRequestState,
        canSendNewCode: canSendNewCode ?? this.canSendNewCode,
        optVerifyState: optVerifyState ?? this.optVerifyState,
        isOtpValid: isOtpValid ?? this.isOtpValid,
        newCodeTime: newCodeTime ?? this.newCodeTime,
        otpValidTime: otpValidTime ?? this.otpValidTime,
      );
}
