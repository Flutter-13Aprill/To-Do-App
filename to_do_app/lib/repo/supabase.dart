import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:to_do_app/layer_data/app_data.dart';
import 'package:to_do_app/model/task/task_model.dart';

class SupabaseConnect {
  static Supabase? supabase;

  static Future<void> init() async {
    try {
      await dotenv.load(fileName: ".env");

      supabase = await Supabase.initialize(
        url: dotenv.env["baseURL"].toString(),
        anonKey: dotenv.env["anonKey"].toString(),
      );
      log("connect to supabase");
    } catch (error) {
      throw FormatException("There is error with connecting");
    }
  }

  // to Add task to supabase
  static addNewTask({required TaskModel task}) async {
    await supabase?.client.from("task").insert(task.mapForAddSupabase());
    await GetIt.I.get<AppDataLayer>().loadDataFromSupabase();
  }
  // to get tasks to supabase

  static getTasks() async {
    final result = await supabase?.client.from("task").select();
    List<TaskModel> tasks = [];
    if (result!.isNotEmpty) {
      tasks =
          result.map((task) {
            return TaskModelMapper.fromMap(task);
          }).toList();
    }
    return tasks;
  }
  // to update tasks

  static taskUpdate({required isDone, required id}) async {
    await supabase?.client.from("task").update({"isDone": isDone}).eq("id", id);
    await GetIt.I.get<AppDataLayer>().loadDataFromSupabase();
  }

  // to delete task

  static taskDelete({required id}) async {
    await supabase?.client.from("task").delete().eq("id", id);
    await GetIt.I.get<AppDataLayer>().loadDataFromSupabase();
  }

  // for signup
  static Future<User> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final user = await supabase!.client.auth.signUp(
        password: password,
        email: email,
      );
      return user.user!;
    } on AuthException catch (error) {
      throw FormatException(error.message);
    } catch (error) {
      throw FormatException("There is error with sign Up");
    }
  }

  // for signup
  static Future<User> login({
    required String email,
    required String password,
  }) async {
    try {
      final user = await supabase!.client.auth.signInWithPassword(
        password: password,
        email: email,
      );
      return user.user!;
    } on AuthException catch (error) {
      throw FormatException(error.message);
    } catch (error) {
      throw FormatException("There is error with sign in");
    }
  }
}
