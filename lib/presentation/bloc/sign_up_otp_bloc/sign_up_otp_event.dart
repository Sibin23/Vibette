part of 'sign_up_otp_bloc.dart';

@immutable
sealed class SignUpOtpEvent {}

final class OnOtpVerificationButtonClickedEvent extends SignUpOtpEvent {
  final String otp;
  final String email;

  OnOtpVerificationButtonClickedEvent({required this.otp, required this.email});
}
