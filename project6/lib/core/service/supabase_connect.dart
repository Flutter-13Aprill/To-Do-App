//Supabase (data base)
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConnect {
  static Supabase? supabase;
  // Initialize of Supabase
  static Future<void> init() async {
    try {
      await dotenv.load(fileName: ".env");
      supabase = await Supabase.initialize(
        url: dotenv.env['uRL'].toString(),
        anonKey: dotenv.env["key"].toString(),
      );
    } catch (e) {
      throw FormatException("There is error with connect DB");
    }
  }

  //SignUp Method
  static Future<User> signUp({
    required String userName,
    required String password,
  }) async {
    try {
      //Auth table from supabase
      final user = await supabase!.client.auth.signUp(
        email: '$userName@myapp.com',
        password: password,
        data: {'user_name': userName},
      );
      // get data from the Auth table and put it inside users table
      print("*******:${user.user}");
      final userData = user.user!;
      await supabase!.client.from('users').insert({
        "user_id": userData.id,
        'user_name': userName,
      });

      return userData;
    } on AuthException catch (error) {
      throw FormatException(error.message);
    } catch (e) {
      throw FormatException("There is error with sign Up");
    }
  }

  //SignIn Method
  static Future<User> logIn({
    required String userName,
    required String password,
  }) async {
    try {
      final userAuth = await supabase!.client.auth.signInWithPassword(
        email: '$userName@myapp.com',
        password: password,
      );
      // Step 3: If the user is authenticated, return the user
      if (userAuth.user != null) {
        return userAuth.user!;
      } else {
        throw FormatException("Invalid username or password");
      }
    } on AuthException catch (e) {
      throw FormatException(e.message);
    } catch (e) {
      throw FormatException("There is error with log In");
    }
  }
}
