import 'package:flutter/material.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'task_model.mapper.dart';

@MappableClass()
class TaskModel with TaskModelMappable {
  int? id;
  @MappableField(key: 'iscomplete')
  bool? isComplete;
  final String task;
  final String catagory;
  @MappableField(key: 'catagory_color')
  int? catagoryColor;
  final int priorty;
  final String date;
   TimeOfDay? time;

  TaskModel({
    this.id,
    this.isComplete,
    required this.task,
    required this.catagory,
    this.catagoryColor,
    required this.priorty,
    required this.date,
     this.time,
  });

  mapForAddSupabase() {
    return {
      "iscomplete": isComplete,
      "task": task,
      "catagory": catagory,
      "priorty": priorty,
      "date": '10/10/2025',
    };
  }
}
