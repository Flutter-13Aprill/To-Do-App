class TaskModel {
  final String id;
  final String title;
  final String? description;
  final int? priority;
  final String? categoryId;
  final DateTime? dueDate;
  final DateTime? createdAt;

  TaskModel({
    required this.id,
    required this.title,
    this.description,
    this.priority,
    this.categoryId,
    this.dueDate,
    this.createdAt,
  });

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id']?.toString() ?? '',
      title: map['title'] ?? '',
      description: map['description'],
      priority: map['priority'] is int ? map['priority'] : int.tryParse(map['priority'].toString()),
      categoryId: map['category_id'],
      dueDate: map['due_date'] != null ? DateTime.tryParse(map['due_date']) : null,
      createdAt: map['created_at'] != null ? DateTime.tryParse(map['created_at']) : null,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'description': description,
        'priority': priority,
        'category_id': categoryId,
        'due_date': dueDate?.toIso8601String(),
        'created_at': createdAt?.toIso8601String(),
      };
}
