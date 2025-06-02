import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:getit/Models/todo_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConnect {
  late Supabase supabase;
  List<ToDoModel> todosList = [];
  User? user;

  String getUserName() {
    return user?.email?.split('@').first ?? "Guest";
  }

  int howManyTodosDone() {
    return todosList.where((todo) => todo.isDone).length;
  }

  Future<void> init() async {
    try {
      await dotenv.load(fileName: ".env");

      supabase = await Supabase.initialize(
        url: dotenv.env['supabase_url']!,
        anonKey: dotenv.env['anon_key']!,
      );
    } catch (e) {
      log("Supabase initialization failed: $e");
    }
  }

  Future insertToDo(ToDoModel todo) async {
    try {
      final todosClient = supabase.client;
      final response = await todosClient.from('todos').insert({
        'user_id': todo.userId,
        'task': todo.task,
        'description': todo.description,
        'due_date': todo.dueDate,
        'is_done': todo.isDone,
        'category': todo.category,
        'priority': todo.priority,
      });
      log(response.toString());
      await fetchToDos();

      if (response == null) {
        log("ToDo inserted successfully: ${todo.task}");
      } else {
        log("Error inserting ToDo: ${response.toString()}");
      }
    } catch (e) {
      log("Error inserting ToDo: $e");
    }
  }

  Future updateToDo(ToDoModel todo) async {
    try {
      final todosClient = supabase.client;
      final response = await todosClient
          .from('todos')
          .update(todo.toMap())
          .eq("id", todo.id!);
      log(response.toString());
      await fetchToDos();

      if (response == null) {
        log(
          "ToDo updated successfully: ${todosList[todosList.indexOf(todo)].isDone}",
        );
      } else {
        log("Error updating ToDo: ${response.toString()}");
      }
    } catch (e) {
      log("Error updating ToDo: $e");
    }
  }

  Future fetchToDos() async {
    try {
      final todosClient = supabase.client;
      final todos = await todosClient
          .from('todos')
          .select()
          .eq("user_id", user!.id);
      if (todos.isNotEmpty) {
        this.todosList = todos
            .map<ToDoModel>(
              (todo) => ToDoModelMapper.fromJson(jsonEncode(todo)),
            )
            .toList();
      }
      log(jsonEncode(todos));
    } catch (e) {
      log("Error fetching bootcamps: $e");
    }
  }

  Future<bool> signUpNewUser(String userName, String password) async {
    final AuthResponse res = await supabase.client.auth.signUp(
      email: "$userName@domain.com",
      password: password,
    );
    final Session? session = res.session;
    final User? user = res.user;
    this.user = user;
    await fetchToDos();

    if (session != null) {
      log("User signed up as: ${user?.email}");
      return true;
    } else {
      log("Sign in failed");
      return false;
    }
  }

  Future<bool> signInWithUsername(String username, String password) async {
    final AuthResponse res = await supabase.client.auth.signInWithPassword(
      email: "$username@domain.com",
      password: password,
    );
    final Session? session = res.session;
    final User? user = res.user;
    this.user = user;
    await fetchToDos();

    if (session != null) {
      log("User signed in: ${user?.email}");
      return true;
    } else {
      log("Sign in failed");
      return false;
    }
  }
}
