part of 'reset_password_bloc.dart';

@immutable
sealed class ResetPasswordEvent {}

final class OnConfirmButtonClickEvent extends ResetPasswordEvent {
  final String email;
  final String password;

  OnConfirmButtonClickEvent(this.email, this.password);
}
