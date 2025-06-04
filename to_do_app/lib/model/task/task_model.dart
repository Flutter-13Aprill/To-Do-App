import 'package:dart_mappable/dart_mappable.dart';

part 'task_model.mapper.dart';

@MappableClass()
class TaskModel with TaskModelMappable {
  final int id;
  @MappableField(key: 'created_at')
  final String createdAt;
  final String task;
  final String desciption;
  final String day;
  final String month;
  final String year;
  final int priority;
  final bool isDone;

  TaskModel({
    required this.id,
    required this.createdAt,
    required this.task,
    required this.desciption,
    required this.day,
    required this.month,
    required this.year,
    required this.priority,
    required this.isDone,
  });

  mapForAddSupabase() {
    return {
      "task": task,
      "desciption": desciption,
      "day": day,
      "month": month,
      "year": year,
      "priority": priority,
      "isDone": isDone,
    };
  }
}
