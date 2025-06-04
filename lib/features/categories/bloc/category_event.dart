part of 'category_bloc.dart';

sealed class CategoryEvent {}

class LoadCategoriesEvent extends CategoryEvent {}

class AddCategoryEvent extends CategoryEvent {
  final CategoryModel category;

  AddCategoryEvent(this.category);
}
