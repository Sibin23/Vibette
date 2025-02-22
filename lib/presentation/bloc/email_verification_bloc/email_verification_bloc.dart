import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'email_verification_event.dart';
part 'email_verification_state.dart';

class EmailVerificationBloc
    extends Bloc<EmailVerificationEvent, EmailVerificationState> {
  EmailVerificationBloc() : super(EmailVerificationInitial()) {
    on<OnVerificationButtonClickEvent>((event, emit) async {
      emit(EmailVerificationLoading());
      try {
        await Future.delayed(const Duration(seconds: 2));
        emit(EmailVerificationSuccess());
      } catch (e) {
        emit(EmailVerificationFailure(message: e.toString()));
      }
    });
  }
}
