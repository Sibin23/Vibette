part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}

final class SignUpButtonClickEvent extends SignUpEvent {
  final String name;
  final String email;
  final String phoneNumber;
  final String password;

  SignUpButtonClickEvent(
      {required this.name,
      required this.email,
      required this.phoneNumber,
      required this.password});
}
