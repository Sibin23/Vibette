part of 'sign_up_otp_bloc.dart';

abstract class SignUpOtpState extends Equatable {
  const SignUpOtpState();

  @override
  List<Object> get props => [];
}

class SignUpOtpInitial extends SignUpOtpState {}

class SignUpOtpLoading extends SignUpOtpState {}

class SignUpOtpSuccess extends SignUpOtpState {}

class SignUpOtpFailure extends SignUpOtpState {
  final String message;

  const SignUpOtpFailure({required this.message});

  @override
  List<Object> get props => [message];
}
