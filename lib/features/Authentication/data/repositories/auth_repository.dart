import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uptodo/core/connection_supabase.dart';

class AuthRepository {


  /// [signUpWithUsernamePassword] a method used to create an account for the user
  static Future<AuthResponse> signUpWithUsernamePassword({required String username,required String password,}) async {
    final fakeEmail = '$username@FlutterBootcamp.com';
    return await ConnectionSupabase.supabase!.client.auth.signUp(
      email: fakeEmail,
      password: password,
    );
  }

  /// [ signInWithUsernamePassword ] a method used to sign in with username
  static Future<AuthResponse> signInWithUsernamePassword({required String username,required String password,}) async {
    final fakeEmail = '$username@FlutterBootcamp.com';
    return await ConnectionSupabase.supabase!.client.auth.signInWithPassword(
      email: fakeEmail,
      password: password,
    );
  }
}