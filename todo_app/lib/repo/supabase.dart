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
    final userId = supabase?.client.auth.currentUser?.id;
    if (userId == null) throw Exception("User not authenticated");
    await supabase?.client.from('task').insert(taskData.mapForAddSupabase());
  }

  static updateTaskData() async {
    final userId = supabase?.client.auth.currentUser?.id;
    if (userId == null) throw Exception("User not authenticated");
    final allData = await supabase?.client.from('task').update({
      'user_id': userId,
    });
    if (allData == null || allData.isEmpty) {
      return [];
    }
    return allData.map((items) {
      return TaskModelMapper.fromMap(items);
    }).toList();
  }

  static getTaskData() async {
    final userId = supabase?.client.auth.currentUser?.id;
    final allData = await supabase?.client
        .from('task')
        .select("*")
        .eq('user_id', userId as Object);
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

  static Future<void> signOut() async {
    try {
      await supabase!.client.auth.signOut();
    } catch (error) {
      print('Error signing out');
      rethrow;
    }
  }

  static Future<void> updateEmail(String newEmail) async {
    try {
      await supabase!.client.auth.updateUser(UserAttributes(email: newEmail));
    } catch (e) {
      throw Exception("Failed to update password: $e");
    }
  }

  static Future<void> updatePassword(String newPassword) async {
    try {
      await supabase!.client.auth.updateUser(
        UserAttributes(password: newPassword),
      );
    } catch (e) {
      throw Exception("Failed to update email: $e");
    }
  }
}
