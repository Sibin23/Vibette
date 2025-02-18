import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<OnSignInButtonClickEvent>((event, emit) async {
      emit(SignInLoading());
      try {
        await Future.delayed(const Duration(seconds: 2));
        emit(SignInSuccess());
      } on Exception catch (e) {
        emit(SignInFailure(message: e.toString()));
      } finally {
        emit(SignInInitial());
      }
    });
  }
}
