import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:todoapp_darkmode/data/repo/task_repsitory.dart';
import 'package:todoapp_darkmode/models/task_model.dart';

class TaskRepositoryImpl implements TaskRepository {
  final supabase = Supabase.instance.client;

  // @override
  // Future<void> addTask(TaskModel task) async {
  //   await supabase.from('tasks').insert({
  //     'title': task.title,
  //     'description': task.description,
  //     'date': task.date.toIso8601String(),
  //     'time': '${task.time.hour}:${task.time.minute}',
  //     'priority': task.priority,
  //     'category': task.category,
  //     'category_color': task.categoryColor.value,
  //   });
  // }
@override
Future<void> addTask(TaskModel task) async {
  final payload = {
    'title': task.title,
    'description': task.description,
    'date': task.date.toIso8601String(),
    'time': '${task.time.hour}:${task.time.minute}',
    'priority': task.priority,
    'category': task.category,
    'category_color': task.categoryColor.value,
  };

  print("Sending to Supabase: $payload");

  final response = await supabase.from('tasks').insert(payload);

  print("Insert response: $response");
}

  @override
  Future<List<TaskModel>> loadTasks() async {
    final response = await supabase.from('tasks').select();
    return (response as List)
        .map((data) => TaskModel.fromMap(data))
        .toList();
  }

  @override
  Future<void> updateTask(TaskModel task) async {
    await supabase
        .from('tasks')
        .update({
          'title': task.title,
          'description': task.description,
          'date': task.date.toIso8601String(),
          'time': '${task.time.hour}:${task.time.minute}',
          'priority': task.priority,
          'category': task.category,
          'category_color': task.categoryColor.value,
        })
        .eq('id', task.id as Object);
  }
  @override
Future<void> deleteTask(int id) async {
  await supabase
      .from('tasks')
      .delete()
      .eq('id', id); // This deletes the row where 'id' matches
}

}




