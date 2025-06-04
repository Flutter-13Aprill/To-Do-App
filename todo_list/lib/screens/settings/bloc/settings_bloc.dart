import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  bool isEnable;

  SettingsBloc({required this.isEnable}) : super(SettingsInitial()) {
    on<ChangeLanguageEvent>((event, emit) {
      isEnable = !isEnable;
      emit(SuccessState());
    });
  }
}
