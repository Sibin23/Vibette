part of 'sign_in_bloc.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class SignInLoading extends SignInState {
  final bool isGoogleLoading;

  SignInLoading({this.isGoogleLoading = false});
}

final class SignInSuccess extends SignInState {}

final class SignInFailure extends SignInState {
  final String message;
  SignInFailure({required this.message});
}

final class GoogleSignIn extends SignInState {}
