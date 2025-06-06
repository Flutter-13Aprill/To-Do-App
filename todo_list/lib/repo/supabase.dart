import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_list/models/task/task_model.dart';

class SupabaseConnect {
  static Supabase? supabase;
  static Future<void> init() async {
    try {
      log("+++ connect supabase start ***");
      await dotenv.load(fileName: ".env");
      supabase = await Supabase.initialize(
        url: dotenv.env["url"].toString(),
        anonKey: dotenv.env["anon_key"].toString(),
      );
      log("+++ connect supabase done ***");
    } catch (error) {
      throw FormatException("There is error with connect DB");
    }
  }

  static Future<User> signUp({
    required String email,
    required String password,
  }) async {
    try {
      print("--------5");
      final user = await supabase!.client.auth.signUp(
        password: password,
        email: email,
      );
      print("--------6");
      return user.user!;
    } on AuthException catch (error) {
      throw FormatException(error.message);
    } catch (error) {
      throw FormatException("There is error with sign Up");
    }
  }

  static addNewTask({required TaskModel dataUser}) async {
    await supabase?.client.from('tasks').insert(dataUser.mapForAddSupabase());
  }

  static Future<User> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabase!.client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.user == null) {
        throw FormatException("wrong");
      }
      return response.user!;
    } on AuthException catch (error) {
      throw FormatException(error.message);
    } catch (error) {
      throw FormatException("wrong");
    }
  }

  static Future<int> getCompletedTasksCount() async {
    final user = Supabase.instance.client.auth.currentUser;
    if (user == null) return 0;

    final data =
        await Supabase.instance.client
                .from('tasks')
                .select('id')
                .eq('user_id', user.id)
                .eq('is_completed', true)
            as List<dynamic>?;

    return data?.length ?? 0;
  }

  static String? getUsersername() {
    final user = Supabase.instance.client.auth.currentUser;
    if (user == null || user.email == null) return null;

    final email = user.email!;
    final atIndex = email.indexOf('@');

    return email.substring(0, atIndex);
  }

  static Future<void> logout() async {
    try {
      await Supabase.instance.client.auth.signOut();
      print("User logged out successfully");
    } catch (e) {
      print("Error during logout: $e");
    }
  }

  static Future<int> getInCompletedTasksCount() async {
    final user = Supabase.instance.client.auth.currentUser;
    if (user == null) return 0;

    final data =
        await Supabase.instance.client
                .from('tasks')
                .select('id')
                .eq('user_id', user.id)
                .eq('is_completed', false)
            as List<dynamic>?;

    return data?.length ?? 0;
  }

  static Future<void> updateEmail(String newEmail) async {
    try {
      final response = await Supabase.instance.client.auth.updateUser(
        UserAttributes(email: newEmail),
      );

      if (response.user == null) {
        throw FormatException("Failed to update email");
      }

      print("Email updated successfully to $newEmail");
    } on AuthException catch (e) {
      throw FormatException(e.message);
    } catch (e) {
      throw FormatException("Unexpected error occurred while updating email");
    }
  }

  static Future<void> changeUserPassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      final user = Supabase.instance.client.auth.currentUser;

      if (user == null || user.email == null) {
        throw FormatException("User is not logged in");
      }

      final session = await Supabase.instance.client.auth.signInWithPassword(
        email: user.email!,
        password: oldPassword,
      );

      if (session.user == null) {
        throw FormatException('Incorrect current password');
      }

      final updateResponse = await Supabase.instance.client.auth.updateUser(
        UserAttributes(password: newPassword),
      );

      if (updateResponse.user == null) {
        throw FormatException('Password update failed');
      }

      print("Password updated successfully");
    } on AuthException catch (e) {
      throw FormatException(e.message);
    } catch (e) {
      throw FormatException('Unexpected error while changing password');
    }
  }

  static Future<void> deleteTask({required int taskId}) async {
    try {
      await supabase?.client.from('tasks').delete().eq('id', taskId);

      print("deleted successfully.");
    } catch (e) {
      print("Error while deleting task");
    }
  }
}
