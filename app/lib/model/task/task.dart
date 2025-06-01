// lib/model/task/task.dart
class Task {
  final String? id; // ID الخاص بـ Supabase، يمكن أن يكون null عند الإنشاء
  final String title;
  final String description;
  final String dueDate; // ISO 8601 string
  final int priority;
  final bool isCompleted;
  final String? createdAt; // ISO 8601 string
  final String? userId; // User ID من Supabase
  final String catogryName;
  final int catogryColor;
  final int iconlable;

  Task({
    this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.priority,
    this.isCompleted = false,
    this.createdAt,
    this.userId,
    required this.catogryName,
  required  this.iconlable,
  required  this.catogryColor,
  });

  // لتحويل بيانات Supabase (Map) إلى Task object
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as String?,
      title: map['title'] as String,
      description: map['description'] as String,
      dueDate: map['due_date'] as String,
      priority: map['priority'] as int,
      isCompleted: map['is_completed'] as bool,
      createdAt: map['created_at'] as String?,
      userId: map['user_id'] as String?,
      catogryName: map['catogryName'],
      catogryColor: map['catogryColor'],
      iconlable: map['iconlable'],
    );
  }

  // لتحويل Task object إلى Map لإرساله إلى Supabase
  Map<String, dynamic> toMap({bool includeId = true}) {
    final map = {
      'title': title,
      'description': description,
      'due_date': dueDate,
      'priority': priority,
      'is_completed': isCompleted,
      'created_at': createdAt,
      'user_id': userId,
      'catogryName': catogryName,
      'catogryColor': catogryColor,
      'iconlable': iconlable,
    };

    if (includeId && id != null) {
      map['id'] = id;
    }

    return map;
  }

  // لإنشاء نسخة من الـ Task مع تغيير بعض الخصائص (اختياري، ولكنه مفيد)
  Task copyWith({
    String? id,
    String? title,
    String? description,
    String? dueDate,
    int? priority,
    bool? isCompleted,
    String? createdAt,
    String? userId,
    final String? catogryName,
    final int? catogryColor,
    final int? iconlable,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      priority: priority ?? this.priority,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt ?? this.createdAt,
      userId: userId ?? this.userId,
      iconlable: iconlable ?? this.iconlable,
      catogryColor: catogryColor ?? this.catogryColor,
      catogryName: catogryName ?? this.catogryName,
    );
  }
}
