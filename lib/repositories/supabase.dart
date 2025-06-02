import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:to_do_list/model/tasks/task_model.dart';
import 'package:to_do_list/model/user/user_model.dart';

class SupabaseConnect {
  static Supabase? supabase;
  // Supabase Initialzier
  static Future<void> start() async {
    try {
      log("+== connecting to the Supabase Starting ==+");
      await dotenv.load(fileName: ".env");
      supabase = await Supabase.initialize(
        url: dotenv.env['url'].toString(),
        anonKey: dotenv.env['anon_key'].toString(),
      );
      log("+== connecting to the Supabase Successful ==+");
    } catch (e) {
      throw FormatException("X-X-X Connecting to the SupaBase Failed X-X-X");
    }
  }

  /// Supabase Methods -----------------------------

  // Function to get all tasks from Supabase
  static getTasks() async {
    log("Starting getTasks()");
    final tasks = await supabase?.client.from('tasks').select();
    List<TaskModel> tasksList = [];

    // check if the request from the database is either "null" or "empty"
    if (tasks != null || tasks!.isNotEmpty) {
      tasksList = tasks.map((item) {
        return TaskModelMapper.fromMap(item);
      }).toList();
    }
    log("Finished Getting Tasks");
    return tasksList;
  }

  // Function to get all users from the Supabase
  static getUsers() async {
    log("Start Getting Users");
    final users = await supabase?.client.from('users').select();
    List<UserModel> userList = [];

    if (users != null || users!.isNotEmpty) {
      userList = users.map((item) {
        return UserModelMapper.fromMap(item);
      }).toList();
    }
    log("Finished Getting Users");
    return userList;
  }

  // Function to get all the tasks for a specific user

  static getUserTasks() async {
    final userTasks = await supabase!.client
        .from('tasks')
        .select('')
        .eq; //How to get the refrence key
  }

  // Function to  authenticate the user to (Sign Up)
  static signUp({
    required String email,
    required String password,
  }) async {
    try {
      final user = await supabase!.client.auth.signUp(
        password: password,
        email: email,
      );
      return user.user!;
    } catch (e) {
      throw FormatException("Error in the Sign Up");
    }
  }

  static  login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabase?.client.auth.signInWithPassword(
        password: password,
        email: email,
      );
      
    } catch (e) {
      // TODO
    }
  }
}
