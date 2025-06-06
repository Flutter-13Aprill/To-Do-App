import 'package:dart_mappable/dart_mappable.dart';

part 'task_model.mapper.dart';

@MappableClass()
class TaskModel with TaskModelMappable {
  final int? id;
  final String title;
  final String? description;
  @MappableField(key: 'category_id')
  final int? categoryId;
  final int priority;
  final DateTime datetime;
  @MappableField(key: 'created_at')
  final String? createdAt;
  @MappableField(key: 'user_id')
  final String userId;
  @MappableField(key: 'is_completed')
  final bool isCompleted;
  @MappableField(key: 'is_deleted')
  final bool isDeleted;

  TaskModel({
    this.id,
    required this.title,
    this.description,
    this.categoryId,
    required this.priority,
    required this.datetime,
    this.createdAt,
    required this.userId,
    required this.isCompleted,
    required this.isDeleted,
  });

  mapForAddSupabase() {
    return {
      'title': title,
      'description': description,
      'category_id': categoryId,
      'priority': priority,
      'datetime': datetime.toIso8601String(),
      'user_id': userId,
      'is_completed': isCompleted,
      'is_deleted': isDeleted,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] as int?,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      categoryId: int.tryParse(map['category_id'].toString()) ?? 0,
      priority: int.tryParse(map['priority'].toString()) ?? 0,
      datetime: DateTime.parse(map['datetime']),
      userId: map['user_id'] ?? '',
      isCompleted: map['is_completed'] ?? false,
      isDeleted: map['is_deleted'] ?? false,
    );
  }
}
