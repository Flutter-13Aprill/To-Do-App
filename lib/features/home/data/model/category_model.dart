import 'package:flutter/material.dart';

class CategoryModel {
  const CategoryModel({required this.categoryName, required this.categoryIconPath , this.categoryColor,  this.categoryClickedColor});

  final String categoryName;
  final String categoryIconPath;
  final Color? categoryColor;
  final Color? categoryClickedColor;
}