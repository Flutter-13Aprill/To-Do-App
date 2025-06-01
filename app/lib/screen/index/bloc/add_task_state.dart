part of 'add_task_bloc.dart';

@immutable
sealed class AddTaskState { // لم نعد نستخدم extends Equatable
  // لم نعد نحتاج @override List<Object> get props => [];
}

class AddTaskInitial extends AddTaskState {
  final int taskPriority;

  AddTaskInitial({this.taskPriority = 1});

  AddTaskInitial copyWith({int? taskPriority}) {
    return AddTaskInitial(
      taskPriority: taskPriority ?? this.taskPriority,
    );
  }

  // لم نعد نحتاج @override List<Object> get props => [taskPriority];
}

class AddTaskLoading extends AddTaskState {} // لم نعد نحتاج @override List<Object> get props => [];

class TaskAddedState extends AddTaskState {
  final String taskTitle;

  TaskAddedState({required this.taskTitle});

  // لم نعد نحتاج @override List<Object> get props => [taskTitle];
}

class AddTaskError extends AddTaskState {
  final String message;

  AddTaskError({required this.message});

 }



class CatogryNameState extends AddTaskState {
  String name; 

  CatogryNameState({required this.name, });
}

class CatogryIconState extends AddTaskState {
  IconData iconName;
   int indexIcon;
  CatogryIconState({required this.iconName,required this.indexIcon});
}

class CatogryColorState extends AddTaskState {
  final Color catogryColors;  int colorIndex;

  CatogryColorState({required this.catogryColors,required this.colorIndex});
}
// حالات خاصة بإنشاء الفئة
class CategoryCreatedSuccessfully extends AddTaskState {
  final String categoryName;
  CategoryCreatedSuccessfully({required this.categoryName});
}