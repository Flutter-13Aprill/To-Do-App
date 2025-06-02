import 'package:to_do_app/data/services/supabase_service.dart';
import 'package:to_do_app/features/tasks/models/task_model.dart';
import 'package:to_do_app/di/service_locator.dart';

class TaskRepository {
  final SupabaseService supabaseService = sl<SupabaseService>();

  Future<void> addTask(TaskModel task) async {
    await supabaseService.insertTask(task.toJson());
  }

  Future<List<TaskModel>> getAllTasks() async {
    final raw = await supabaseService.getTasks();
    return raw.map((data) => TaskModel.fromJson(data)).toList();
  }
}
