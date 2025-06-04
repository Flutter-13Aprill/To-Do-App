import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/widgets.dart';

part 'category_model.mapper.dart';

@MappableClass()
class CategoryModel with CategoryModelMappable {
  final String? categoryId;
  final String categoryName;
  final IconData categoryIcon;
  final Color categoryColor;

  CategoryModel({
    this.categoryId,
    required this.categoryName,
    required this.categoryIcon,
    required this.categoryColor,
  });

  Map<String, dynamic> mapForAddShared() {
    return {
      'category_name': categoryName,
      'category_icon': categoryIcon.toString(),
      'category_color': categoryColor.toARGB32().toString(),
    };
  }

  factory CategoryModel.fromMapForShared(Map<String, dynamic> map) {
    return CategoryModel(
      categoryId: map['category_id'],
      categoryName: map['category_name'],
      categoryIcon: IconData(map['category_icon']),
      categoryColor: Color(map['category_color']),
    );
  }
}
