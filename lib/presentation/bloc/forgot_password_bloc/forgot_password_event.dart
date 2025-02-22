part of 'forgot_password_bloc.dart';

@immutable
sealed class ForgotPasswordEvent {}

final class OnGetOTPbuttonClickEvent extends ForgotPasswordEvent {
  final String email;

  OnGetOTPbuttonClickEvent({required this.email});
}
