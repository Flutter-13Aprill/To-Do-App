import 'package:flutter/material.dart';

class TaskModel {
  final int? id;
  final String title;
  final String? description;
  final DateTime date;
  final TimeOfDay time;
  final int priority;
  final String category;
  final Color categoryColor;

  TaskModel({
    this.id,
    required this.title,
    this.description,
    required this.date,
    required this.time,
    required this.priority,
    required this.category,
    required this.categoryColor,
  });

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    final timeParts = (map['time'] as String).split(':');
    return TaskModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      date: DateTime.parse(map['date']),
      time: TimeOfDay(hour: int.parse(timeParts[0]), minute: int.parse(timeParts[1])),
      priority: map['priority'],
      category: map['category'],
      categoryColor: Color(map['category_color']),
    );
  }
}





