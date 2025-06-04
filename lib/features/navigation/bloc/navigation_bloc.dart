import 'package:flutter_bloc/flutter_bloc.dart';

sealed class NavigationState {}

class HomeTab extends NavigationState {}

class CalendarTab extends NavigationState {}

class ProfileTab extends NavigationState {}

sealed class NavigationEvent {}

class NavigateToHome extends NavigationEvent {}

class NavigateToCalendar extends NavigationEvent {}

class NavigateToProfile extends NavigationEvent {}

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(HomeTab()) {
    on<NavigateToHome>((event, emit) => emit(HomeTab()));
    on<NavigateToCalendar>((event, emit) => emit(CalendarTab()));
    on<NavigateToProfile>((event, emit) => emit(ProfileTab()));
  }
}
