
import 'package:todoapp_darkmode/models/task_model.dart';


// class TaskRepository {
//   final supabase = Supabase.instance.client;

//   Future<void> addTask(TaskModel task) async {
//     await supabase.from('tasks').insert({
//       'title': task.title,
//       'description': task.description,
//       'date': task.date.toIso8601String(),
//       'time': '${task.time.hour}:${task.time.minute}',
//       'priority': task.priority,
//       'category': task.category,
//       'category_color': task.categoryColor.value,
//     });
//   }

//   Future<List<TaskModel>> loadTasks() async {
//     final response = await supabase.from('tasks').select();
//     return (response as List).map((data) => TaskModel.fromMap(data)).toList();
//   }
// }



abstract class TaskRepository {
  Future<void> addTask(TaskModel task);
  Future<List<TaskModel>> loadTasks();
   Future<void> updateTask(TaskModel task); 
  Future<void> deleteTask(int id);         
}



