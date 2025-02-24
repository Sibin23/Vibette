part of 'timer_cubit.dart';

sealed class TimerState extends Equatable {
  final int elapsed;
  final int startTime;

  const TimerState({required this.elapsed, required this.startTime});

  @override
  List<Object> get props => [elapsed, startTime];
}

final class TimerInitial extends TimerState {
  const TimerInitial() : super(elapsed: 0, startTime: 0);
}

final class TimerProgress extends TimerState {
  TimerProgress(int elapsed)
      : super(
            elapsed: elapsed, startTime: DateTime.now().millisecondsSinceEpoch);
}

final class TimerError extends TimerState {
  final String message;

  const TimerError(this.message) : super(elapsed: 0, startTime: 0);
}
