import 'package:dart_mappable/dart_mappable.dart';

// This will be generated
part 'task_model.mapper.dart';

@MappableClass()
class TaskModel with TaskModelMappable {
  final String id;
  final String taske;
  final String description;
  final DateTime selectedTime;
  final DateTime createdAt;

  TaskModel({
    required this.id,
    required this.taske,
    required this.description,
    required this.selectedTime,
    required this.createdAt,
  });
}