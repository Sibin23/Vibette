import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(const TimerInitial());

  Timer? _timer;
  int? _endTime;
  int _duration = 60; // Store the initial duration

  void startTimer([int durationInSeconds = 60]) {
    _duration = durationInSeconds; // Set the current duration
    WakelockPlus.enable();
    _endTime =
        DateTime.now().millisecondsSinceEpoch + (durationInSeconds * 1000);
    emit(TimerProgress(0));
    _timer = Timer.periodic(const Duration(seconds: 1), _onTick);
  }

  void _onTick(Timer timer) {
    if (state is TimerProgress) {
      int remaining =
          (_endTime! - DateTime.now().millisecondsSinceEpoch) ~/ 1000;

      if (remaining <= 0) {
        // Check if remaining time is less than or equal to 0
        _stopTimer();
      } else {
        emit(TimerProgress(_duration - remaining)); // Emit the elapsed time
      }
    } else {
      _stopTimer();
    }
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
    WakelockPlus.disable();
    emit(const TimerInitial()); // Reset to TimerInitial
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
  void timerError(String message) {
    _stopTimer(); // Optionally stop the timer
    emit(TimerError(message)); // Emit an error state
  }

 

}
