part of 'sign_in_bloc.dart';

@immutable
sealed class SignInEvent {}

class OnSignInButtonClickEvent extends SignInEvent {
  final String email;
  final String password;
  OnSignInButtonClickEvent({required this.email, required this.password});
}

class OnSignInWithGoogleEvent extends SignInEvent {}
