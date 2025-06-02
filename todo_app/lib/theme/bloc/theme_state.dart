part of 'theme_bloc.dart';

@immutable
class ThemeState {
  final ThemeData themeData;
  const ThemeState(this.themeData);
}

final class ThemeInitial extends ThemeState {
  const ThemeInitial(super.themeData);
}
