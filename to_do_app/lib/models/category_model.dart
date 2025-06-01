import 'package:flutter/material.dart';

class CategoryModel {
  final String name;
  final Icon icon;
  final Color color;
  final bool isSelected;

  CategoryModel({required this.name, required this.icon, required this.color,this.isSelected=false});
}

