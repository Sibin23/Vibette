import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:vibette/domain/repository/authentication/authentication_repository.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<OnSignInButtonClickEvent>((event, emit) async {
      emit(SignInLoading());
      try {
        final response = await AuthenticationRepository.userLogin(
            email: event.email, password: event.password);

        if (response != null && response.statusCode == 200) {
          return emit(SignInSuccess());
        } else if (response != null) {
          final responseData = jsonDecode(response.body);
          return emit(SignInFailure(message: responseData["message"]));
        } else {
          return emit(SignInFailure(message: "something went wrong"));
        }
      } on Exception catch (e) {
        emit(SignInFailure(message: e.toString()));
      }
    });
  }
}
