import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'all_messages_event.dart';
part 'all_messages_state.dart';

class AllMessagesBloc extends Bloc<AllMessagesEvent, AllMessagesState> {
  AllMessagesBloc() : super(AllMessagesInitial()) {
    on<AllMessagesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
