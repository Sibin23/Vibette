import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:vibette/domain/repository/authentication/authentication_repository.dart';

part 'sign_up_otp_event.dart';
part 'sign_up_otp_state.dart';

class SignUpOtpBloc extends Bloc<SignUpOtpEvent, SignUpOtpState> {
  SignUpOtpBloc() : super(SignUpOtpInitial()) {
    on<OnOtpVerificationButtonClickedEvent>((event, emit) async {
      emit(SignUpOtpLoading());

      var response = await AuthenticationRepository.verifyOtp(
        event.email,
        event.otp,
      );
      print(response!.body);
      if (response.statusCode == 200) {
        emit(SignUpOtpSuccess());
      } else if (response.statusCode == 401) {
        final responseData = jsonDecode(response.body);

        print("888888888888888888888888888888888$responseData");

        return emit(SignUpOtpFailure(
            message:
                "You alredy have an account with this mail id please login"));
      } else
        final responseData = jsonDecode(response.body);

      return emit(SignUpOtpFailure(message: 'check the otp again'));
    });
  }
}
