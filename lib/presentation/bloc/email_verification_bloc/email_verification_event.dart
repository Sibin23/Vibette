part of 'email_verification_bloc.dart';

@immutable
sealed class EmailVerificationEvent {}

final class OnVerificationButtonClickEvent extends EmailVerificationEvent {
  final String email;
  final String verificationCode;
  OnVerificationButtonClickEvent(
      {required this.verificationCode, required this.email});
}
