import 'dart:math';

import 'package:to_do_list/model/tasks/task_model.dart';
import 'package:to_do_list/model/user/user_model.dart';
import 'package:to_do_list/repositories/supabase.dart';

class AppModelLayer {
  List<UserModel> users = [];
  List<TaskModel> tasks = [];

  loadTasksData() async {
    tasks = await SupabaseConnect.getTasks();
    print(tasks);
    print(tasks.length);
  }

  loadUserData() async {
    users = await SupabaseConnect.getUsers();
    print(users);
    print(users.length);
  }
}
