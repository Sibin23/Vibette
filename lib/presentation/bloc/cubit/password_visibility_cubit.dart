import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordVisibilityState {
  final bool isObscured;

  PasswordVisibilityState({required this.isObscured});

  PasswordVisibilityState copyWith({bool? isObscured}) {
    return PasswordVisibilityState(
      isObscured: isObscured ?? this.isObscured,
    );
  }
}

class PasswordVisibilityCubit extends Cubit<PasswordVisibilityState> {
  PasswordVisibilityCubit() : super(PasswordVisibilityState(isObscured: true));

  void toggleVisibility() {
    emit(state.copyWith(isObscured: !state.isObscured));
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

class ConfirmPasswordVisibilityCubit
    extends Cubit<ConfirmPasswordVisibilityState> {
  ConfirmPasswordVisibilityCubit()
      : super(ConfirmPasswordVisibilityState(isObscured: true));

  void toggleVisibility() {
    emit(state.copyWith(isObscured: !state.isObscured));
  }
}
