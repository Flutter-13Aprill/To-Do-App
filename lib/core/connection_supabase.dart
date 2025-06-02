import 'dart:developer';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uptodo/core/helpers/exceptions/exceptions.dart';
import 'package:uptodo/features/home/data/model/task_model.dart';

class ConnectionSupabase {

  static Supabase? _supabase = Supabase.instance;

  /// [init] a method use to connect with the supabase services
  static Future<void> init() async{

    try{
      
      log('*** Connecting with Supabase ***');

      await dotenv.load(fileName: '.env');

      _supabase = await Supabase.initialize(
        url: dotenv.get('supabase_url'),
        anonKey: dotenv.get('anon_public_key')
      );

      log('*** Connection with Supabase has been done successfully ***');

    }catch(error){
      throw SupabaseRepoException(error.toString());
    }
  }

  /// [signUpWithUsernamePassword] a method used to create an account for the user
  static Future<AuthResponse> signUpWithUsernamePassword({required String username, required String password}) async {
    final fakeEmail = '$username@gmail.com';
    return await _supabase!.client.auth.signUp(
      email: fakeEmail,
      password: password
    );
  }

  /// [ signInWithUsernamePassword ] a method used to sign in with username
  static Future<AuthResponse> signInWithUsernamePassword({required String username,required String password,}) async {
    final fakeEmail = '$username@gmail.com';
    return await _supabase!.client.auth.signInWithPassword(
      email: fakeEmail,
      password: password,
    );
  }


  static Future<void> signOut() async{
    await _supabase!.client.auth.signOut();
  }


  String getUserName(){
    final session = _supabase!.client.auth.currentSession;
    final user = session!.user;

    final indexOfHash = user.email!.indexOf('@');

    return user.email!.substring(0, indexOfHash);
  }

  static Future<List<TaskModel>> getTasks() async {

    final result = await _supabase?.client.from('tasks').select();

    List<TaskModel> tasks = [];

    if(result != null || result!.isNotEmpty){
      tasks = result.map((task) => TaskModelMapper.fromMap(task)).toList();
    }

    return tasks;

  }

  static addNewTask({ required TaskModel task}) async {
    await _supabase?.client.from('tasks').insert(task);
  }
}