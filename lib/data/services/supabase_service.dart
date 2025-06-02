import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final client = Supabase.instance.client;
  //To add a task
  Future<void> insertTask(Map<String, dynamic> data) async {
    await client.from('tasks').insert(data);
  }

  //To get all tasks
  Future<List<Map<String, dynamic>>> getTasks() async {
    final response = await client.from('tasks').select();
    return List<Map<String, dynamic>>.from(response);
  }
}
