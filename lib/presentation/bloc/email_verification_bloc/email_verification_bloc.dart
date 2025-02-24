import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibette/domain/repository/authentication/authentication_repository.dart';

part 'email_verification_event.dart';
part 'email_verification_state.dart';

class EmailVerificationBloc
    extends Bloc<EmailVerificationEvent, EmailVerificationState> {
  EmailVerificationBloc() : super(EmailVerificationInitial()) {
    on<OnVerificationButtonClickEvent>((event, emit) async {
      emit(EmailVerificationLoading());
      try {
        var response = await AuthenticationRepository.verifyOtpPasswordReset(
            event.email, event.verificationCode);
        if (response != null && response.statusCode == 200) {
          var responseBody = jsonDecode(response.body);
          if (responseBody["status"]) {
            return emit(EmailVerificationSuccess());
          } else {
            if (kDebugMode) {
              print(responseBody);
            }
            return emit(EmailVerificationFailure(message: 'invalid OTP'));
          }
        } else {
          return emit(
              EmailVerificationFailure(message: 'something went wrong'));
        }
      } catch (e) {
        emit(EmailVerificationFailure(message: e.toString()));
      }
    });
    on<OnResedOtpButtonClickedEvent>(
      (event, emit) async {
        try {
          await AuthenticationRepository.resetPasswordSentOtp(event.email);
        } catch (e) {
          emit(EmailVerificationFailure(message: e.toString()));
        }
      },
    );
  }
}
