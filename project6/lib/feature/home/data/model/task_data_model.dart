import 'package:dart_mappable/dart_mappable.dart';

part 'task_data_model.mapper.dart';

@MappableClass()
class TaskDataModel with TaskDataModelMappable {
  final String task;
  final String description;
  final String date;
  final String time;
  final String status;
  final int taskCategory;

  TaskDataModel({
    required this.task,
    required this.description,
    required this.date,
    required this.time,
    required this.status,
    required this.taskCategory,
  });
}
