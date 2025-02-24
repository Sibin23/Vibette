import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:vibette/domain/models/user/user_model.dart';
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

      if (response!.statusCode == 200) {
        emit(SignUpOtpSuccess());
      } else if (response.statusCode == 401) {
        jsonDecode(response.body);
        return emit(const SignUpOtpFailure(
            message:
                "You alredy have an account with this mail id please login"));
      } else {
        return emit(const SignUpOtpFailure(message: 'check the otp again'));
      }
    });
    on<OnResendOTPButtonclickedEvent>(
      (event, emit) async {
        try {
          Response? response =
              await AuthenticationRepository().sentOtp(event.user);

          if (response != null) {
            switch (response.statusCode) {
              case 200:
                emit(SignUpOtpSuccess());
                break;
              case 400:
                final responseData = jsonDecode(response.body);
                emit(SignUpOtpFailure(
                    message: responseData["message"] ?? "Bad request"));
                break;
              case 401:
                emit(const SignUpOtpFailure(
                    message:
                        "You alredy have an  account with the same email id , so try to log in."));
                break;
              case 403:
                emit(const SignUpOtpFailure(
                    message:
                        "Forbidden. You do not have permission to access this resource."));
                break;
              case 404:
                emit(const SignUpOtpFailure(message: "Resource not found."));
                break;
              case 500:
                emit(const SignUpOtpFailure(
                    message:
                        "Internal server message. Please try again later."));
                break;
              default:
                emit(SignUpOtpFailure(
                    message:
                        "Unexpected message occurred. Status code: ${response.statusCode}"));
                break;
            }
          } else {
            emit(const SignUpOtpFailure(
                message:
                    "No response from server. Please check your internet connection."));
          }
        } catch (e) {
          emit(SignUpOtpFailure(message: e.toString()));
        }
      },
    );
  }
}
