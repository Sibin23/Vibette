part of 'sign_up_otp_bloc.dart';

@immutable
sealed class SignUpOtpState {}

final class SignUpOtpInitial extends SignUpOtpState {}

final class SignUpOtpLoading extends SignUpOtpState {}

final class SignUpOtpSuccess extends SignUpOtpState {}

final class SignUpOtpFailure extends SignUpOtpState {
  final String message;
  SignUpOtpFailure({required this.message});
}
