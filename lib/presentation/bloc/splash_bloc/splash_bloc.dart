import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashStartedEvent>((event, emit) async {
      print("SplashStartedEvent received"); // Debug print
      emit(SplashLoading());
      try {
        await Future.delayed(const Duration(seconds: 3));
        print("Delay finished"); // Debug print

        // Replace with your actual authentication logic
        bool isLoggedIn = true; // For now, assume logged in
        print("isLoggedIn: $isLoggedIn"); // Debug print

        if (isLoggedIn) {
          emit(SplashLoaded());
          print("Emitting SplashLoaded"); // Debug print
        } 
      } catch (e) {
        emit(SplashLoading());
        emit(SplashError(e.toString()));
        print("Error: ${e.toString()}"); // Debug print
      }
    });
  }
}
