import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:vibette/domain/repository/authentication/authentication_repository.dart';
part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordInitial()) {
    on<OnGetOTPbuttonClickEvent>((event, emit) async {
      emit(ForgotPasswordLoading());
      try {
        var response =
            await AuthenticationRepository.resetPasswordSentOtp(event.email);
        if (response != null && response.statusCode == 200) {
          var responseBody = jsonDecode(response.body);
          if (responseBody["status"] == 200) {
            emit(ForgotPasswordSuccess());
          } else {
            emit(ForgotPasswordFailure(message: responseBody["message"]));
          }
        } else {
          emit(ForgotPasswordFailure(message: 'something went wrong'));
        }
      } catch (e) {
        emit(ForgotPasswordFailure(message: e.toString()));
      }
    });
  }
}
