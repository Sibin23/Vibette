import 'package:bloc/bloc.dart';

part 'password_visibility_state.dart';

class PasswordVisibilityCubit extends Cubit<PasswordVisibilityState> {
  PasswordVisibilityCubit() : super(PasswordVisibilityState(isObscured: true));

  void toggleVisibility() {
    emit(state.copyWith(isObscured: !state.isObscured));
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
