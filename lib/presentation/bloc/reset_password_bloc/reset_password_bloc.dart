import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:vibette/domain/repository/authentication/authentication_repository.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc() : super(ResetPasswordInitial()) {
    on<OnConfirmButtonClickEvent>((event, emit) async {
      emit(ResetPasswordLoading());
       var response =
          await AuthenticationRepository.updatePassword(event.email, event.password);
      if (response != null && response.statusCode == 200) {
        return emit(ResetPasswordSuccess());
      } else if (response != null) {
        var finalResponse = jsonDecode(response.body);
        return emit(ResetPasswordFailure(message: finalResponse["message"]));
      } else {
        return emit(ResetPasswordFailure(message: 'Something went wrong'));
      }
    });
  }
}
