import 'package:to_do_app/core/models/categories/categories_model.dart';
import 'package:to_do_app/core/models/task/task_model.dart';
import 'package:to_do_app/core/repo/supabase.dart';
class TaskService {
  List<TaskModel>? _cachedTasks;

  Future<List<TaskModel>> getTasks() async {
    if (_cachedTasks != null) return _cachedTasks!;
    
    final tasksData = await SupabaseConnect.getTasks();

    if (tasksData is List) {
      _cachedTasks = tasksData.map((e) => TaskModel.fromMap(e)).toList();
    } else {
      _cachedTasks = [];
    }

    return _cachedTasks!;
  }

  Future<List<TaskModel>> getTasksByDate(DateTime date) async {
    final tasks = await SupabaseConnect.getTasksByDate(date);
    return tasks;
  }

  void clearCache() {
    _cachedTasks = null;
  }
}
