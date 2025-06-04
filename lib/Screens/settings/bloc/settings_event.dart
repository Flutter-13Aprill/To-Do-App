part of 'settings_bloc.dart';

@immutable
sealed class SettingsEvent {}

final class ChangeLanguageEvent extends SettingsEvent {
  final BuildContext context;

  ChangeLanguageEvent(this.context);
}
