import 'package:todo_app/model/task_model.dart';
import 'package:todo_app/repo/supabase.dart';

/// AppDataLayer is a simple data handler class responsible for managing
/// and loading the list of tasks from a Supabase backend.
class AppDataLayer {
  List<TaskModel> tasks = [];

  loadDataFromSupabase() async {
    tasks = await SupabaseConnect.getTaskData();

    return tasks;
  }
}
