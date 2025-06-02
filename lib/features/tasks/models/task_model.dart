import 'package:flutter/material.dart';

class TaskModel {
  final String title;
  final String description;
  final DateTime date;
  final TimeOfDay time;
  final int priority;

  TaskModel({
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.priority,
  });

  String get timeFormatted =>
      '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
//Convert the task to Map send to Supabase
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
      'time': timeFormatted,
      'priority': priority,
    };
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    final timeParts = (json['time'] as String).split(':');
    return TaskModel(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      date: DateTime.parse(json['date']),
      time: TimeOfDay(
        hour: int.parse(timeParts[0]),
        minute: int.parse(timeParts[1]),
      ),
      priority: json['priority'] ?? 1,
    );
  }
}
