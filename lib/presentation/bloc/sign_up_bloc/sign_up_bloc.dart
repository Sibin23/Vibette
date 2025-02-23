import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:vibette/domain/models/user/user_model.dart';
import 'package:vibette/domain/repository/authentication/authentication_repository.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpButtonClickEvent>((event, emit) async {
      UserModel finalDatas = UserModel(
        userName: event.name,
        password: event.password,
        phoneNumber: event.phoneNumber,
        emailId: event.email,
      );
      emit(SignUpLoading());

      try {
        Response? response =
            await AuthenticationRepository().sentOtp(finalDatas);

        if (response != null) {
          switch (response.statusCode) {
            case 200:
              emit(SignUpSuccess(user: finalDatas));
              break;
            case 400:
              final responseData = jsonDecode(response.body);
              emit(SignUpFailure(
                  message: responseData["message"] ?? "Bad request"));
              break;
            case 401:
              emit(SignUpFailure(
                  message:
                      "You alredy have an  account with the same email id , so try to log in."));
              break;
            case 403:
              emit(SignUpFailure(
                  message:
                      "Forbidden. You do not have permission to access this resource."));
              break;
            case 404:
              emit(SignUpFailure(message: "Resource not found."));
              break;
            case 500:
              emit(SignUpFailure(
                  message: "Internal server message. Please try again later."));
              break;
            default:
              emit(SignUpFailure(
                  message:
                      "Unexpected message occurred. Status code: ${response.statusCode}"));
              break;
          }
        } else {
          emit(SignUpFailure(
              message:
                  "No response from server. Please check your internet connection."));
        }
      } catch (e) {
        emit(SignUpFailure(message: "An exception occurred: $e"));
      }
    });
  }
}
