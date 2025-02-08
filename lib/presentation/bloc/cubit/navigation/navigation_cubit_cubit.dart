import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navigation_cubit_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationCubitInitial());
   void changeIndex(int index) {
    emit(NavigationChanged(index));
  }
}
