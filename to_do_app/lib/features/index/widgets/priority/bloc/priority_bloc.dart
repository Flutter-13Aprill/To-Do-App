import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'priority_event.dart';
part 'priority_state.dart';

class PriorityBloc extends Bloc<PriorityEvent, PriorityState> {
  PriorityBloc() : super(PriorityState(selectedPriority: null)) {
    on<SelectPriority>((event, emit) {
      emit(PriorityState(selectedPriority: event.priority));
    });
  }
}
