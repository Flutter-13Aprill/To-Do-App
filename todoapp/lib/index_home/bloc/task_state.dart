part of 'task_bloc.dart';

sealed class TaskState {}

// final class TaskLoadingState extends TaskState {}

final class loodingState extends TaskState {}

final class TaskLoadedState {
  final List<Task> tasks;
  final int? selectedPriority;
  final String? pressedButton;
  final category? selectedCategory;
  // final File? selecte
  final String? searchquery;

  TaskLoadedState({
    required this.tasks,
    this.selectedPriority,
    this.pressedButton,
    this.selectedCategory,
    this.searchquery,
  });

  TaskLoadedState copyWith({
    List<Task>? tasks,
    int? selectedPriority,
    String? pressedButton,
    category? selectedCategory,
    String? searchquery,
  }) {
    return TaskLoadedState(
      tasks: tasks ?? this.tasks,
      selectedPriority: selectedPriority ?? this.selectedPriority,
      pressedButton: pressedButton ?? this.pressedButton,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      searchquery: searchquery ?? this.searchquery,
    );
  }
}
