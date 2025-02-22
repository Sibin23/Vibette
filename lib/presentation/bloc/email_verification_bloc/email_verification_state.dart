part of 'email_verification_bloc.dart';

@immutable
sealed class EmailVerificationState {}

final class EmailVerificationInitial extends EmailVerificationState {}
final class EmailVerificationLoading extends EmailVerificationState {}
final class EmailVerificationSuccess extends EmailVerificationState {}
final class EmailVerificationFailure extends EmailVerificationState {
  final String message;
   EmailVerificationFailure({required this.message});
}
