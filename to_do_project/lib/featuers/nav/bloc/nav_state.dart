part of 'nav_bloc.dart';

sealed class NavState {}

final class NavInitial extends NavState {}

//change the UI
final class RefreshUIState extends NavState {}
