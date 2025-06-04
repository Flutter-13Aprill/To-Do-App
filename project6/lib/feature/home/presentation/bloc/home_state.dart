part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {}

final class HomeFailure extends HomeState {
  final String message;
  HomeFailure({required this.message});
}

//date
final class DateSelected extends HomeState {
  final DateTime date;
  DateSelected({required this.date});
}

//Time
final class TimeSelected extends HomeState {
  final DateTime date;
  TimeSelected({required this.date});
}

//TaskPrioritySelected
final class TaskPrioritySelected extends HomeState {
  final int priority;
  TaskPrioritySelected({required this.priority});
}

//Create Category
final class CategoryState extends HomeState {
  final CategoryModel selectedCategory;
  CategoryState(this.selectedCategory);
}

//Color
final class ColorCategoryState extends HomeState {
  final Color color;
  ColorCategoryState({required this.color});
}

//Icon
final class IconCategoryState extends HomeState {
  final IconData icon;
  IconCategoryState({required this.icon});
}

class CategoriesLoadedState extends HomeState {
  final List<CategoryModel> categories;
  CategoriesLoadedState({required this.categories});
}