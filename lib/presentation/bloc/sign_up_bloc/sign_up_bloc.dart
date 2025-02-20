import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpButtonClickEvent>((event, emit) async {
      emit(SignUpLoading());
      try {
        debugPrint('sign in loading');
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        await Future.delayed(const Duration(seconds: 2));
        debugPrint('Loading Completed');
        emit(SignUpSuccess());
      } on Exception catch (e) {
        emit(SignUpFailure(message: e.toString()));
      }
    });
  }
}
