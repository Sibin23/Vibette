import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordInitial()) {
    on<OnGetOTPbuttonClickEvent>((event, emit) async {
      emit(ForgotPasswordLoading());
      try {
        await Future.delayed(const Duration(seconds: 1));
        emit(ForgotPasswordSuccess());
      } catch (e) {
        emit(ForgotPasswordFailure(message: e.toString()));
      }
    });
  }
}
