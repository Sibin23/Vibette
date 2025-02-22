import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<OnSignInButtonClickEvent>((event, emit) async {
      emit(SignInLoading());
      try {
        debugPrint('sign in loading');
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        await Future.delayed(const Duration(seconds: 2));
        debugPrint('Loading Completed');
        emit(SignInSuccess());
      } on Exception catch (e) {
        emit(SignInFailure(message: e.toString()));
      }
    });
    on<OnSignInWithGoogleEvent>((event, emit) async {
      emit(SignInLoading(isGoogleLoading: true));
      try {
        debugPrint('sign in loading');
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        await Future.delayed(const Duration(seconds: 2));
        debugPrint('Loading Completed');
        emit(SignInSuccess());
      } on Exception catch (e) {
        emit(SignInFailure(message: e.toString()));
      }
    });
  }
}
