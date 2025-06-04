import 'dart:developer';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uptodo/core/helpers/exceptions/exceptions.dart';
import 'package:uptodo/features/home/data/model/task_model.dart';

class ConnectionSupabase {

  static Supabase? supabase = Supabase.instance;

  static User? user;

  /// [init] a method use to connect with the supabase services
  static Future<void> init() async{

    try{
      
      log('*** Connecting with Supabase ***');

      await dotenv.load(fileName: '.env');

      supabase = await Supabase.initialize(
        url: dotenv.get('supabase_url'),
        anonKey: dotenv.get('anon_public_key')
      );

      log('*** Connection with Supabase has been done successfully ***');

    }catch(error){
      log('----- Error with connection with Supabase');
      throw SupabaseRepoException(error.toString());
    }
  }



  static Future<void> signOut() async{
    await supabase!.client.auth.signOut();
  }


  String getUserName(){
    final session = supabase!.client.auth.currentSession;
    final user = session!.user;

    final indexOfHash = user.email!.indexOf('@');

    return user.email!.substring(0, indexOfHash);
  }

  static Future<List<TaskModel>> getTasks() async {

    final result = await supabase?.client.from('tasks').select();

    List<TaskModel> tasks = [];

    if(result != null || result!.isNotEmpty){
      tasks = result.map((task) => TaskModelMapper.fromMap(task)).toList();
    }

    return tasks;

  }

  static addNewTask({ required TaskModel task}) async {
    await supabase?.client.from('tasks').insert(task);
  }
}