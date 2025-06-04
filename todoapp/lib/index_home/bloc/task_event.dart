part of 'task_bloc.dart';

@immutable
abstract class TaskEvent {}

class AddTaskevent extends TaskEvent {
final Task task;

  AddTaskevent({required this.task});


}

class TaskPrioritychose extends TaskEvent{
  final int Priorityindex;

  TaskPrioritychose({required this.Priorityindex});
}

// class buttonpressed extends TaskEvent{
//   final String button;

//   buttonpressed({required this.button});
  
// }

class taskcategorychose extends TaskEvent{
  final category categoryindex;

  taskcategorychose({required this.categoryindex}); 
  
}

class ToggleTaskCompletion extends TaskEvent{
  final int index ;

  ToggleTaskCompletion({required this.index});

 
}

class UpdateSearchQuery extends TaskEvent{
  final String searchtext;

  UpdateSearchQuery({required this.searchtext});

}

class SelectetCategoryimage extends TaskEvent{
  final File image;

  SelectetCategoryimage({required this.image}); 

}
class SelectedcategoryColor extends TaskEvent{
final Color colorcategory;

  SelectedcategoryColor({required this.colorcategory});

}


class NewCategory extends TaskEvent{
  final category newcategory;

  NewCategory({required this.newcategory});
}