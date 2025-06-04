import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app/model/task/task_model.dart';

class SupabaseConnect {
  static Supabase? supabase;
  static Future<void> init() async {
    try {
      await dotenv.load(fileName: ".env");

      supabase = await Supabase.initialize(
        url: dotenv.env["s_url"].toString(),
        anonKey: dotenv.env["anon_key"].toString(),
      );
    } catch (e) {
      throw FormatException('There is error with connect$e');
    }
  }

  Future<User> signUp({
    required String username,
    required String password,
  }) async {
    try {
      final user = await supabase!.client.auth.signUp(
        password: password,
        email: '$username@gmail.com',
      );
      await supabase!.client.from('users').insert({
        'id': user.user!.id,
        'username': username,
      });
      return user.user!;
    } on AuthException catch (error) {
      throw FormatException(error.message);
    } catch (e) {
      throw FormatException('There is error with sign up');
    }
  }

  Future<void> signIn({
    required String username,
    required String password,
  }) async {
    try {
      await supabase!.client.auth.signInWithPassword(
        email: '$username@gmail.com',
        password: password,
      );
    } on AuthException catch (error) {
      throw FormatException(error.message);
    } catch (e) {
      throw FormatException('There is error with sign in');
    }
  }

  Future<void> signOut() async {
    try {
      await supabase!.client.auth.signOut();
    } on AuthException catch (e) {
      throw FormatException(e.message);
    } catch (e) {
      throw FormatException("There is error with sign out");
    }
  }

  Future<void> addTask(TaskModel task) async {
    await supabase!.client.from('tasks').insert(task.toMap());
  }

  Future<List<TaskModel>> getTasks(String userId) async {
    final response = await supabase!.client
        .from('tasks')
        .select()
        .eq('user_id', userId)
        .order('date_time', ascending: true);

    return (response as List).map((json) => TaskModel.fromJson(json)).toList();
  }

  String getCurrentUserId() {
    return supabase!.client.auth.currentUser!.id;
  }
}
