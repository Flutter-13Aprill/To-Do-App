import 'dart:developer';

import 'package:uptodo/core/connection_supabase.dart';
import 'package:uptodo/features/home/data/model/task_model.dart';

class TaskRepo {

  static Future<void> addTask(TaskModel task) async{
    try{

      await ConnectionSupabase.supabase!.client.from('tasks').insert(task.convertToMap());

    }catch(error){
      log('You big dev, I think your supabase is not working well go check it out');
      throw Exception('Something went wrong while we adding the task');
    }
  }
}