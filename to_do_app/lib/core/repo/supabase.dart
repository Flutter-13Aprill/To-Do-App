import 'dart:developer';

import 'package:bcrypt/bcrypt.dart';
import 'package:to_do_app/core/models/bootcamps/bootcamps_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:to_do_app/core/models/user/user_model.dart';
import 'package:intl/intl.dart';

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
  static Future<bool> loginUser({
  required String username,
  required String password,
}) async {
  try {
    final response = await supabase?.client
        .from('users')
        .select('password')
        .eq('username', username)
        .maybeSingle();

    if (response == null) return false;

    final storedHashedPassword = response['password'];
    final isPasswordCorrect = BCrypt.checkpw(password, storedHashedPassword);

    return isPasswordCorrect;
  } catch (e) {
    
    return false;
  }
}
static Future<List<dynamic>> getCategories() async {
  try {
    final response = await supabase?.client
        .from('categories')
        .select();

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
    return [];
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


  static getUsersData() async {
    final allData = await supabase?.client
        .from('users')
        .select();

    if (allData == null || allData.isEmpty) {
      return [];
    }

    return allData.map((items) {
      return UserModelMapper.fromMap(items);
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
