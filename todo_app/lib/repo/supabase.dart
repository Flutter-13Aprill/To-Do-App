import 'dart:developer';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app/model/task_model.dart';

/// SupabaseConnect manages the connection and interactions with the Supabase backend.
class SupabaseConnect {
  static Supabase? supabase;
  static Future<void> init() async {
    try {
      await dotenv.load(fileName: ".env");
      supabase = await Supabase.initialize(
        url: dotenv.env['url'].toString(),
        anonKey: dotenv.env['key'].toString(),
      );
      log("+++ connect supabase done ***");
    } catch (_) {
      throw FormatException("There is error with connect DB");
    }
  }

  static addNewTask({required TaskModel taskData}) async {
    await supabase?.client.from('task').insert(taskData.mapForAddSupabase());
  }

  static getTaskData() async {
    final allData = await supabase?.client.from('task').select("*");
    if (allData == null || allData.isEmpty) {
      return [];
    }
    return allData.map((items) {
      return TaskModelMapper.fromMap(items);
    }).toList();
  }

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

  static Future<User> logIn({
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
      throw FormatException("There is error with sign Up");
    }
  }
}
