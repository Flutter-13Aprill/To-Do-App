part of 'layout_bloc.dart';

@immutable
sealed class LayoutState {}

final class LayoutInitial extends LayoutState {}
final class ChangePageSuccessfully extends LayoutState {}
final class AddTaskSuccessfully extends LayoutState {}
final class ShowBottomSheetSuccessfully extends LayoutState {}
final class ShowCalenderSuccessfully extends LayoutState {}
final class ShowTagSuccessfully extends LayoutState {}
final class ShowFlagSuccessfully extends LayoutState {}

