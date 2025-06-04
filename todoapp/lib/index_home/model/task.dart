// import 'package:todoapp/index_home/model/category.dart';

// class Task {
//   final String title;
//   final String description;
//   final int priority;
// final category categor;
// final bool isCompleted;

//   Task({required this.title, required this.description, required this.priority, required this.categor,  this.isCompleted=false});

 



//   // Map<String, dynamic> toMap() {
//   //   return {
//   //     'title': title,
//   //     'description': description,
//   //   };
//   // }

//   // factory Task.fromMap(Map<String, dynamic> map) {
//   //   return Task(
//   //     title: map['title'],
//   //     description: map['description'],
//   //     priority:map["priority"],
//   //   );
//   // }
// }

import 'package:flutter/material.dart';
import 'package:todoapp/index_home/model/category.dart';

class Task {
  final String title;
  final String description;
  final int priority;
  final category categor;
  final bool isCompleted; 
  final DateTime day;
final TimeOfDay time;

  Task({
    required this.title,
    required this.description,
    required this.priority,
    required this.categor,
    this.isCompleted = false,
    required this.day,
 required this.time,
  });

  Task copyWith({
    String? title,
    String? description,
    int? priority,
    category? categor,
    bool? isCompleted,
    DateTime? day,
  TimeOfDay? time,
  }) {
    return Task(
      title: title ?? this.title,
      description: description ?? this.description,
      priority: priority ?? this.priority,
      categor: categor ?? this.categor,
      isCompleted: isCompleted ?? this.isCompleted,
      day:day??this.day,
    time:time??this.time,
    );
  }
}