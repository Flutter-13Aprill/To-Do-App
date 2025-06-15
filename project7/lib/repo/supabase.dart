import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseRepo {
  final supabase = Supabase.instance.client;

  Future<void> addTaskSupabase(String title, String description) async {
    final response = await supabase.from('tasks').insert({
      'title': title,
      'description': description,
    });
  }
}
