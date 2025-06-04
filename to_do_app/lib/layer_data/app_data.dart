import 'package:to_do_app/model/task/task_model.dart';
import 'package:to_do_app/repo/supabase.dart';

class AppDataLayer {
  List<TaskModel> tasks = [];

  loadDataFromSupabase() async {
    tasks = await SupabaseConnect.getTasks();
  }
}
