import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:to_do_app/models/task_model.dart';

class SupabaseConnect {
  static Supabase? supabase;
  static Future<void> init() async {
    try {
      log("+++ connect supabase start ***");
      await dotenv.load(fileName: ".env");
      log("//////////////");
      supabase = await Supabase.initialize(
        url: dotenv.env["baseUrl"].toString(),
        anonKey: dotenv.env["anonKey"].toString(),
      );
      log("+++ connect supabase done ***");
      // await signInUser(userName: 'omaraluslami', password: '123123');
      // await getUserInfo();
 
      // await addTask(TaskModel(title: "test", description: "test", dateTime: DateTime(2025, 6, 1, 17, 0, 0), priority: 2, categoryId: 1, isDone: false));
    } catch (error) {
      throw FormatException("There is error with connect DB $error");
    }
  }

  static getUserInfo() async {
    final result = await supabase?.client.from("usertable").select();
    print(result);
  }

  static registerNewUser({
    required String userName,
    required String password,
    required String confirmPassword,
  }) async {
    print("registerNewUser $userName , $password , $confirmPassword");
    if (confirmPassword == password) {
      try {
        final result = await supabase?.client.from("usertable").insert({
          'username': userName,
          'password': password,
        });
        return result;
      } catch (error) {
        throw FormatException("There is error with connect DB $error");
      }
    }
  }

  static signInUser({
    required String userName,
    required String password,
  }) async {
    print("signInUser_____________");
    try {
      final result = await supabase?.client
          .from("usertable")
          .select('id, username,password')
          .eq('username', '$userName')
          .maybeSingle();
      return result;
    } catch (error) {
      throw FormatException("There is error with connect DB $error");
    }
  }

  static getTasks() async {
    final result = await supabase?.client.from("task").select();
    print("getTasks ${result} ");
    List<TaskModel> tasks = [];
    if (result != null || result!.isNotEmpty) {
      tasks = result.map((task) {
        return TaskModel.fromJson(task);
      }).toList();
    }
    print("getTasks ${tasks.length} ");

    return tasks;
  }

  static addTask({required TaskModel task}) async {
    final result = await supabase?.client.from("task").insert(task.toJson(1));

    print("$result -----=======-----");
    // List<TaskModel> tasks = [];
    // if (result != null || result!.isNotEmpty) {
    //   tasks = result.map((task) {
    //     return TaskModel.fromJson(task);
    //   }).toList();
    // }

    // return tasks;
  }

  //   /// get bootcamps
  //   static addNewStudent({required UserMode dataUser}) async {
  //     await supabase?.client
  //         .from('students')
  //         .insert(dataUser.mapForAddSupabase());
  //   }
  // }

  // changeFormatToDB({required String date}) {
  //   DateFormat formatInput = DateFormat('dd/mm/yyyy');
  //   DateTime dateInput = formatInput.parse(date);
  //   DateFormat formatOutput = DateFormat('mm-dd-yyyy');
  //   String dateOutPut = formatOutput.format(dateInput);

  //   return dateOutPut;
}




// {
//       "title": "Do Math Homework",
//       "description": "Complete the annual financial report",
//       "datetime": DateTime(2025, 6, 1, 17, 0, 0).toIso8601String(),
//       "category": "University",
//       "isdone": false,
//       "priority": 1,
//       "user_id": 1, // Replace with actual logged-in user's ID
//     }