part of 'index_bloc.dart';

@immutable
sealed class IndexEvent {}

class LoadinDataEvent extends IndexEvent {}

class SaveDataEvent extends IndexEvent {}
