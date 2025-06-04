import 'dart:developer';

import 'package:bcrypt/bcrypt.dart';
import 'package:to_do_app/core/models/bootcamps/bootcamps_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:to_do_app/core/models/task/task_model.dart';
import 'package:to_do_app/core/models/user/user_model.dart';
import 'package:intl/intl.dart';

class SupabaseConnect {
  static Supabase? supabase;
  static Future<void> init() async {
    try {
      log("+++ connect supabase start ***");
      await dotenv.load(fileName: ".env");
      supabase = await Supabase.initialize(
        url: dotenv.env["url"]!,
        anonKey: dotenv.env["anon_key"]!,
      );
      log("+++ connect supabase done ***");
    } catch (error) {
      throw FormatException("There is error with connect DB");
    }
  }
static Future<Map<String, dynamic>?> loginUser({
  required String username,
  required String password,
}) async {
  try {
    final response = await supabase?.client
        .from('users')
        .select()
        .eq('username', username)
        .maybeSingle();

    if (response == null) return null;

    final storedHashedPassword = response['password'];
    final isPasswordCorrect = BCrypt.checkpw(password, storedHashedPassword);

    return isPasswordCorrect ? response : null;
  } catch (e) {
    return null;
  }
}
 static Future<List<Map<String, dynamic>>> getUserTasks(String userId) async {
    final response = await supabase?.client 
        .from('tasks')
        .select()
        .eq('user_id', userId)
        .order('created_at', ascending: false);

    if (response == null) {
      throw Exception('no Tasks found');
    }

    return List<Map<String, dynamic>>.from(response);
  }


static Future<List<dynamic>> getCategories() async {
  try {
    final response = await supabase?.client
        .from('categories')
        .select().order('id',ascending: true);

    return response ?? [];
  } catch (e) {
    return [];
  }
}
static Future<List<dynamic>> getTasks() async {
  try {
    final response = await supabase?.client
        .from('tasks')
        .select();

    return response ?? [];
  } catch (e) {
    print("error in task get :$e");
    return [];
  }
}
static Future<List<TaskModel>> getTasksByDate(DateTime date) async {
  final startOfDay = DateTime(date.year, date.month, date.day);
  final endOfDay = DateTime(date.year, date.month, date.day, 23, 59, 59, 999);
  final response = await SupabaseConnect.supabase?.client
      .from('tasks')
      .select()
      .gte('due_date', startOfDay.toIso8601String())
      .lte('due_date', endOfDay.toIso8601String())
      .order('due_date', ascending: true);
  return (response as List).map((e) => TaskModel.fromMap(e)).toList();
}

static Future<void> insertCategory(String name, String icon, int colorIndex) async {
  print(name);
  print(icon);
  print(colorIndex);
  try {
    final response = await supabase?.client.from('categories').insert({
      'title': name,
      'icon_name': icon,
      'color_index': colorIndex,
    });

    if (response != null && response.error != null) {
      throw Exception(response.error!.message);
    }
  } catch (e) {
    print('error in insert category : $e');
    rethrow;
  }
}

static Future<void> updateUsername(int userId, String newUsername) async {
  try {
    final response = await supabase?.client
        .from('users')
        .update({'username': newUsername})
        .eq('id', userId);

    if (response != null && response.error != null) {
      throw Exception(response.error!.message);
    }
  } catch (e) {
    print('Error updating username');
    rethrow;
  }
}


static Future<void> updatePassword(int userId, String newPassword) async {
  try {
    final hashedPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt());

    final response = await supabase?.client
        .from('users')
        .update({'password': hashedPassword})
        .eq('id', userId);

    if (response != null && response.error != null) {
      throw Exception(response.error!.message);
    }
  } catch (e) {
    print('Error updating password');
    rethrow;
  }
}

static Future<bool> registrationUser({
  required String username,
  required String password,
}) async {
  try {
    final hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

    final response = await supabase!.client
        .from('users')
        .insert({
          'username': username,
          'password': hashedPassword,
        });
    if (response == null) {
  return true;
} else {
  
  return false;
}

  } catch (e) {
    return false;
  }
}
static Future<bool> taskFinish({
  required int id,
}) async {
  try {
    final task = await supabase!.client
        .from('tasks')
        .select('is_finish')
        .eq('id', id)
        .single();

    final current = task['is_finish'];

    
    final newState = !current;

    
    final response = await supabase!.client
        .from('tasks')
        .update({'is_finish': newState})
        .eq('id', id);

    return true;
  } catch (e) {
    print('error: $e');
    return false;
  }
}





  static Future<void> addNewUser({
  required String username,
  required String password,
}) async {
  await supabase?.client
      .from('users')
      .insert({
        'username': username,
        'password': password,
      });
      
}


  static Future<List<UserModel>> getUsersData() async {
  final allData = await supabase?.client
      .from('users')
      .select();

  if (allData == null || allData.isEmpty) {
    return [];
  }

  return (allData as List).map((item) {
    return UserModelMapper.fromMap(item);
  }).toList();
}

  static Future<void> addTask({
  required String title,
  String? description,
  int? priority,
  int? categoryId,
  DateTime? dueDate,
}) async {
  final response = await supabase?.client.from('tasks').insert({
    'title': title,
    'description': description,
    'priority': priority,
    'category_id': categoryId,
    'due_date': dueDate?.toIso8601String(),
  });

  if (response != null && response.error != null) {
    throw Exception(response.error!.message);
  }
}

}

changeFormatToDB({required String date}) {
  DateFormat formatInput = DateFormat('dd/MM/yyyy');
  DateTime dateInput = formatInput.parse(date);
  DateFormat formatOutput = DateFormat('mm-dd-yyyy');
  String dateOutPut = formatOutput.format(dateInput);

  return dateOutPut;
}
