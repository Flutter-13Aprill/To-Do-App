part of 'pages_bloc.dart';

@immutable
sealed class PagesEvent {}

final class ChangePageEvent extends PagesEvent{

  final int value;

  ChangePageEvent({required this.value});

}