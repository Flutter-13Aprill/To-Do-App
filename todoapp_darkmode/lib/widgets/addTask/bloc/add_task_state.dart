import 'package:flutter/material.dart';

@immutable
class AddTaskState {
  final String title;
  final String description;
  final DateTime? date;
  final TimeOfDay? time;
  final int priority;
  final String category;
  final Color categoryColor;
  final String categoryImage; // ✅ NEW
   final String? selectedCategoryName;

  const AddTaskState({
    this.title = '',
    this.description = '',
    this.date,
    this.time,
    this.priority = 0,
    this.category = '',
    this.categoryColor = Colors.grey,
    this.categoryImage = '', // ✅ Default empty
        this.selectedCategoryName,
  });

  AddTaskState copyWith({
    String? title,
    String? description,
    DateTime? date,
    TimeOfDay? time,
    int? priority,
    String? category,
    Color? categoryColor,
    String? categoryImage, // ✅ Add this
     String? selectedCategoryName,
  }) {
    return AddTaskState(
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      time: time ?? this.time,
      priority: priority ?? this.priority,
      category: category ?? this.category,
      categoryColor: categoryColor ?? this.categoryColor,
      categoryImage: categoryImage ?? this.categoryImage, // ✅ Finalize
      selectedCategoryName: selectedCategoryName ?? this.selectedCategoryName,
    );
  }
}


