part of 'categories_bloc.dart';


class CategoriesState {
final String name;
  final Color? color;
  final IconData? icon;
  final bool submitted;

  CategoriesState({
    this.name = '',
    this.color,
    this.icon,
    this.submitted = false,
  });

  CategoriesState copyWith({
    String? name,
    Color? color,
    IconData? icon,
    bool? submitted,
  }) {
    return CategoriesState(
      name: name ?? this.name,
      color: color ?? this.color,
      icon: icon ?? this.icon,
      submitted: submitted ?? this.submitted,
    );
  }


}


