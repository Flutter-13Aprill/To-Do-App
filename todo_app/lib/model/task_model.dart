import 'package:dart_mappable/dart_mappable.dart';

part 'task_model.mapper.dart';

@MappableClass()
class TaskModel with TaskModelMappable {
  int? id;
  final String title;
  final String? description;
  final String? category;
  final int? priority;
  @MappableField(key: 'task_time')
  final DateTime? taskTime;
  @MappableField(key: 'is_completed')
  final bool isCompleted;
  @MappableField(key: 'created_at')
  final DateTime? createdAt;
  @MappableField(key: 'updated_at')
  final DateTime? updatedAt;

  TaskModel({
    this.id,
    required this.title,
    this.description,
    this.category,
    this.priority,
    this.taskTime,
    this.isCompleted = false,
    this.createdAt,
    this.updatedAt,
  });

  mapForAddSupabase() {
    return {
      "title": title,
      "description": description,
      "category": category,
      "priority": priority,
      "task_time": taskTime?.toIso8601String(),
      "is_completed": isCompleted,
      "created_at": createdAt?.toIso8601String(),
      "updated_at": updatedAt?.toIso8601String(),
    };
  }
}
