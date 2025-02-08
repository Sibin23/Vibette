part of 'navigation_cubit_cubit.dart';

@immutable
sealed class NavigationState {}

final class NavigationCubitInitial extends NavigationState {}
class NavigationChanged extends NavigationState {
  final int index;
  NavigationChanged(this.index);
}
