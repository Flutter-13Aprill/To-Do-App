part of 'categories_bloc.dart';

@immutable
sealed class CategoriesEvent {}

class CategoryNameChanged extends CategoriesEvent {
  final String name;
  CategoryNameChanged(this.name);
}

class CategoryColorChanged extends CategoriesEvent {
  final Color color;
  CategoryColorChanged(this.color);
}

class CategoryIconChanged extends CategoriesEvent {
  final IconData icon;
  CategoryIconChanged(this.icon);
}

class SubmitCategory extends CategoriesEvent {}
