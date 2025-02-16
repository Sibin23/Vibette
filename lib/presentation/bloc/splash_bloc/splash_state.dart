part of 'splash_bloc.dart';

@immutable
sealed class SplashState {}

final class SplashInitial extends SplashState {}
class SplashLoading extends SplashState {}
class SplashLoaded extends SplashState {}
class SplashError extends SplashState {
  final String message;
  SplashError(this.message);
}