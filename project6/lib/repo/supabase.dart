import 'package:project6/models/task/task_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SupabaseConnect {
  static Supabase? supabase;
  static Future<void> init() async {
    try{

    await dotenv.load(fileName: ".env");
    supabase = await Supabase.initialize(
      url: dotenv.env["url"].toString(),
      anonKey: dotenv.env["anon_key"].toString(),
    );

    }catch (error){
    throw FormatException('There is error with connect DB');
    }
  }
  

static  signup({
  required String username,
  required String password
}) async{


  final AuthResponse user = await supabase!.client.auth.signUp(
  
  email: '$username@gmail.com',
  password: password,
);

  return user.user!;


}


static login({
  required String username,
  required String password
}) async{

final AuthResponse res = await supabase!.client.auth.signInWithPassword(
  email: '$username@gmail.com',
  password: password,
);

}

static addTask({required TaskModel task}) async{

  await supabase?.client.from('tasks').insert(task.mapForAddSupabase());


}
  

}



