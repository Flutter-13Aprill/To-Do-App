class TaskModel {
  final int id;
  final String title;
  final String? description;
  final int priority;
  final int categoryId;
  DateTime dueDate;
  String? proccedDate;
  final DateTime createdAt;
  final bool isFinish;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.priority,
    required this.categoryId,
    required this.dueDate,
    required this.createdAt,
    required this.isFinish,
    this.proccedDate,
  });

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      priority: map['priority'],
      categoryId: map['category_id'],
      dueDate:DateTime.parse(map['due_date'])  ,
      createdAt:DateTime.parse(map['created_at']),
      isFinish: map['is_finish'] ,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'description': description,
        'priority': priority,
        'category_id': categoryId,
        'due_date': dueDate,
        'created_at': createdAt,
        'is_finish': isFinish,
        'proccedDate':'',
      };
}
