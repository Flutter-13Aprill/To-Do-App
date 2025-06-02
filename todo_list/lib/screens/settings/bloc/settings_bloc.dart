import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  bool isEnable = true;

  SettingsBloc() : super(SettingsInitial()) {
    on<ChangeLanguageEvent>((event, emit) {
      isEnable = !isEnable;

      emit(SuccessState());
    });
  }
}
