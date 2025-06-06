import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../../models/app_model.dart';

class TaskState extends Equatable {
  final String title;
  final String description;
  final DateTime? dueDate;
  final String time;
  final String priority;
  final String categoryName;
  final IconData? categoryIcon;
  final Color? categoryColor;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final List<TaskModel> tasks;

  const TaskState({
    required this.title,
    required this.description,
    required this.dueDate,
    required this.time,
    required this.priority,
    required this.categoryName,
    required this.categoryIcon,
    required this.categoryColor,
    required this.tasks,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.isFailure = false,
  });

  factory TaskState.initial() {
    return const TaskState(
      title: '',
      description: '',
      dueDate: null,
      time: '',
      priority: '',
      categoryName: '',
      categoryIcon: null,
      categoryColor: null,
      tasks: [],
    );
  }

  TaskState copyWith({
    String? title,
    String? description,
    DateTime? dueDate,
    String? time,
    String? priority,
    String? categoryName,
    IconData? categoryIcon,
    Color? categoryColor,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
    List<TaskModel>? tasks,
  }) {
    return TaskState(
      title: title ?? this.title,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      time: time ?? this.time,
      priority: priority ?? this.priority,
      categoryName: categoryName ?? this.categoryName,
      categoryIcon: categoryIcon ?? this.categoryIcon,
      categoryColor: categoryColor ?? this.categoryColor,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      tasks: tasks ?? this.tasks,
    );
  }

  @override
  List<Object?> get props => [
    title,
    description,
    dueDate,
    time,
    priority,
    categoryName,
    categoryIcon,
    categoryColor,
    isSubmitting,
    isSuccess,
    isFailure,
    tasks,
  ];
}
