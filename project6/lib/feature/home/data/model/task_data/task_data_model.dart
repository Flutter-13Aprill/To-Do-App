import 'package:dart_mappable/dart_mappable.dart';

part 'task_data_model.mapper.dart';

@MappableClass()
class TaskDataModel with TaskDataModelMappable {
  final String? id;
  final String task;
  final String description;
  final String date;
  final String time;
  final int priority;
  // final CategoryModel category;

  TaskDataModel({
    this.id,
    required this.task,
    required this.description,
    required this.date,
    required this.time,
    required this.priority,
    // required this.category,
  });
  mapForAddSupabase() {
    return {
      'task': task,
      'description': description,
      'date': date,
      'time': time,
      'priority': priority,
      // 'category': category.mapForAddShared(),
    };
  }
}
