part of 'bottomnav_bloc.dart';

@immutable
sealed class BottomnavEvent {}

class NavSelectionEvent extends BottomnavEvent {
  final int index;

  NavSelectionEvent({required this.index});
}
