import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vibette/domain/repository/authentication/authentication_repository.dart';

part 'sign_up_otp_event.dart';
part 'sign_up_otp_state.dart';

class SignUpOtpBloc extends Bloc<SignUpOtpEvent, SignUpOtpState> {
  Timer? _timer;
  int _start = 60;

  SignUpOtpBloc() : super(SignUpOtpInitial()) {
    on<OnOtpVerificationButtonClickedEvent>((event, emit) async {
      emit(SignUpOtpLoading());

      var response = await AuthenticationRepository.verifyOtp(
        event.email,
        event.otp,
      );

      if (response!.statusCode == 200) {
        emit(SignUpOtpSuccess());
      } else if (response.statusCode == 401) {
        final responseData = jsonDecode(response.body);
        return emit(const SignUpOtpFailure(
            message:
                "You alredy have an account with this mail id please login"));
      } else {
        return emit(const SignUpOtpFailure(message: 'check the otp again'));
      }
    });

   on<StartOtpTimerEvent>((event, emit) {
  _start = 60;
  _timer?.cancel();
  _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
    if (_start == 0) {
      timer.cancel();
      emit(OtpTimerFinishedState()); // This emit is likely the problem
    } else {
      _start--;
      emit(OtpTimerTickingState(_start)); // This emit is likely the problem
    }
  });
  emit(OtpTimerStartedState()); // This emit is likely the problem
});
on<TimerFinishedEvent>((event, emit) {  // New event handler
  emit(OtpTimerFinishedState());
});

on<TimerTickedEvent>((event, emit) { // New event handler
  emit(OtpTimerTickingState(event.seconds));
});
    on<ResendOtpEvent>((event, emit) {
      emit(OtpTimerResendingState());
    });

    on<StopOtpTimerEvent>((event, emit) {
      _timer?.cancel();
      emit(SignUpOtpInitial());
    });

  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
