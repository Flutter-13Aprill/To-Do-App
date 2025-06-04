part of 'navigation_bloc.dart';

@immutable
sealed class NavigationEvent {}

class DestinationsSelectedEvent extends NavigationEvent {
  final int selectedDestination;

  DestinationsSelectedEvent({required this.selectedDestination});
}
