part of 'pages_bloc.dart';

@immutable
sealed class PagesState {}

final class PagesInitial extends PagesState {}
final class SuccessState extends PagesState {
  // final int currentIndex;

  // SuccessState({required this.currentIndex});
}
