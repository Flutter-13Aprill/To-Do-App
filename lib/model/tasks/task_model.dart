import 'package:dart_mappable/dart_mappable.dart';

part 'task_model.mapper.dart';

@MappableClass()
class TaskModel with TaskModelMappable {
  final int id;
  @MappableField(key: "task_name")
  final String taskName;
  final String description;
  @MappableField(key: "due_date")
  final String dueDate;

  TaskModel({
    required this.id,
    required this.taskName,
    required this.description,
    required this.dueDate,
  });
}
