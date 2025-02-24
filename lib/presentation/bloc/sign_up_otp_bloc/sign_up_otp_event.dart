part of 'sign_up_otp_bloc.dart';

abstract class SignUpOtpEvent extends Equatable {
  const SignUpOtpEvent();

  @override
  List<Object> get props => [];
}

class OnOtpVerificationButtonClickedEvent extends SignUpOtpEvent {
  final String otp;
  final String email;

  const OnOtpVerificationButtonClickedEvent(
      {required this.otp, required this.email});

  @override
  List<Object> get props => [otp, email];
}

class OnResendOTPButtonclickedEvent extends SignUpOtpEvent {
  final UserModel user;

  const OnResendOTPButtonclickedEvent(this.user);
}
