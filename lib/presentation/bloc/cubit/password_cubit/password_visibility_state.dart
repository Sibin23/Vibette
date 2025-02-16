part of 'password_visibility_cubit.dart';

class PasswordVisibilityState {
  final bool isObscured;

  PasswordVisibilityState({required this.isObscured});

  PasswordVisibilityState copyWith({bool? isObscured}) {
    return PasswordVisibilityState(
      isObscured: isObscured ?? this.isObscured,
    );
  }
}

class ConfirmPasswordVisibilityState {
  final bool isObscured;
  ConfirmPasswordVisibilityState({required this.isObscured});

  ConfirmPasswordVisibilityState copyWith({bool? isObscured}) {
    return ConfirmPasswordVisibilityState(
      isObscured: isObscured ?? this.isObscured,
    );
  }
}