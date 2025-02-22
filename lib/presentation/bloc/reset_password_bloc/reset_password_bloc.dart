import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc() : super(ResetPasswordInitial()) {
    on<OnConfirmButtonClickEvent>((event, emit) async {
      emit(ResetPasswordLoading());
      try {
        await Future.delayed(const Duration(seconds: 1));
        emit(ResetPasswordSuccess());
      } catch (e) {
        emit(ResetPasswordFailure(message: e.toString()));
      }
    });
  }
}
