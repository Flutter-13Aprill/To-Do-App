import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitial()) {
    on<SettingsEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<ChangeLanguageEvent>((event, emit) {
      if (event.context.locale.languageCode == 'en') {
        event.context.setLocale(const Locale('ar'));
      } else {
        event.context.setLocale(const Locale('en', "US"));
      }
      emit(LanguageChangedState());
    });
  }
}
