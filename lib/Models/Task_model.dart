import 'package:flutter/material.dart';
import 'package:to_do_app_development/Models/Catagory_Model.dart';

enum TaskPriority { p1, p2, p3,p4,p5,p6,p7,p8,p9,p10 }

class Task {
  final String title;
  final String description;
  final DateTime? dueDate;
  final TimeOfDay? dueTime;
  final TaskPriority priority;
  final Category category;
  bool isCompleted;

  Task({
    required this.title,
    this.description = '',
    this.dueDate,
    this.dueTime,
    this.priority = TaskPriority.p1,
    this.isCompleted = false,
    required this.category,
  });

  Task copyWith({
    String? title,
    String? description,
    DateTime? dueDate,
    TimeOfDay? dueTime,
    TaskPriority? priority,
    Category? category,
    bool? isCompleted,
  }) {
    return Task(
      title: title ?? this.title,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      dueTime: dueTime ?? this.dueTime,
      priority: priority ?? this.priority,
      isCompleted: isCompleted ?? this.isCompleted,
      category: category ?? this.category,
    );
  }
}
