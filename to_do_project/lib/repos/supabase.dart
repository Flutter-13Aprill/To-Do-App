

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConnect {
  static Supabase? supabase;
  static Future<void> init() async { // this to intial supabase
    try {
      print("now will starting connect supabase");
      await dotenv.load(fileName: ".env");
      supabase = await Supabase.initialize(
        url: dotenv.env["s_url"].toString(),
        anonKey: dotenv.env["anon_key"].toString(),
      );
      print("supposed to connect supabase now");  
    } catch (error) {
      throw FormatException("There is error with connect DB");
    }
  }


  static Future<User> signUp({
    required String email,
    required String password,
  }) async {
    try {
      print("--------5");
      final user = await supabase!.client.auth.signUp(
        password: password,
        email: '$email@hotmail.com',
      );
      print("--------6");
      return user.user!;
    } on AuthException catch (error) {
      throw FormatException(error.message);
    } catch (error) {
      throw FormatException("There is error with sign Up");
    }
  }
}

