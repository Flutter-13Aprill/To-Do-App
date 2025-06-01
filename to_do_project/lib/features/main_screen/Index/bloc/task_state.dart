import 'package:equatable/equatable.dart';
import '../../../../models/app_model.dart';

class TaskState extends Equatable {
  final String title;
  final String description;
  final DateTime? dueDate;
  final String time;
  final String priority;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final List<TaskModel> tasks;

  const TaskState({
    required this.title,
    required this.description,
    required this.dueDate,
    required this.time,
    required this.priority,
    required this.tasks,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.isFailure = false,
  });

  factory TaskState.initial() {
    return const TaskState(
      title: '',
      description: '',
      dueDate: null,
      time: '',
      priority: '',
      tasks: [],
    );
  }

  TaskState copyWith({
    String? title,
    String? description,
    DateTime? dueDate,
    String? time,
    String? priority,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
    List<TaskModel>? tasks,
  }) {
    return TaskState(
      title: title ?? this.title,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      time: time ?? this.time,
      priority: priority ?? this.priority,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      tasks: tasks ?? this.tasks,
    );
  }

  @override
  List<Object?> get props => [
    title,
    description,
    dueDate,
    time,
    priority,
    isSubmitting,
    isSuccess,
    isFailure,
    tasks,
  ];
}
