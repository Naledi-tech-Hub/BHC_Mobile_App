import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:bhc_mobile_app/util/enums.dart';

part 'otp_page_state.dart';

@injectable
class OtpPageCubit extends Cubit<OtpPageState> {
  OtpPageCubit(
  ) : super(const OtpPageState(newCodeTime: '60s', otpValidTime: '1:00')) {
    _startAllTimers();
  }


  StreamSubscription<int>? sendNewCodeSub;

  StreamSubscription<int>? codeIsValidSub;

  Stream<int> tick({required int ticks}) {
    return Stream.periodic(const Duration(seconds: 1), (x) => ticks - x - 1)
        .take(ticks);
  }

  _startCodeValidTimer() {
    codeIsValidSub?.cancel();
    codeIsValidSub = tick(ticks: 60).listen(
      (event) {
        emit(state.copyWith(otpValidTime: _formatTime(event)));
      },
      onDone: () {
        emit(state.copyWith(isOtpValid: false));
      },
    );
  }

  void _startNewCodeTimer() {
    sendNewCodeSub?.cancel();
    sendNewCodeSub = tick(ticks: 60).listen((event) {
      emit(state.copyWith(newCodeTime: '${event}s'));
    }, onDone: () {
      emit(state.copyWith(canSendNewCode: true));
    });
  }

  void _startAllTimers() {
    _startNewCodeTimer();
    _startCodeValidTimer();
  }

  Future<void> requestOtp() async {
    try {
      emit(state.copyWith(otpRequestState: BaseBlocStates.loading));
      _startAllTimers();
      emit(state.copyWith(
        otpRequestState: BaseBlocStates.success,
        optVerifyState: BaseBlocStates.data,
        isOtpValid: true,
        newCodeTime: '60s',
        otpValidTime: '1:00',
        canSendNewCode: false,
      ));
    } catch (error, trace) {
      emit(state.copyWith(otpRequestState: BaseBlocStates.error));
    }
  }

  Future<void> verifyOtp(String value) async {
    try {
      emit(state.copyWith(optVerifyState: BaseBlocStates.loading));
      emit(state.copyWith(optVerifyState: BaseBlocStates.success));
    } catch (error, trace) {
      emit(state.copyWith(optVerifyState: BaseBlocStates.error));
    }
  }


  String _formatTime(int timeLeft) {
    int sec = timeLeft % 60;
    int min = (timeLeft / 60).floor();
    String minute = min.toString().length <= 1 ? "$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return "$minute:$second";
  }

  @override
  Future<void> close() {
    sendNewCodeSub?.cancel();
    codeIsValidSub?.cancel();
    return super.close();
  }
}
