part of 'index_bloc.dart';

@immutable
sealed class IndexState {}

final class IndexInitial extends IndexState {}

final class SuccessLoad extends IndexState {}

final class SuccessUpdate extends IndexState {}
