part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {
  final UserModel user;
  SignUpSuccess({required this.user});
}

final class SignUpFailure extends SignUpState {
  final String message;
  SignUpFailure({required this.message});
}
