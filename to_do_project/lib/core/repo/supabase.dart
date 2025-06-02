import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStart {
  static Supabase? supabase;
  static SupabaseClient get client => supabase!.client;

  static Future<void> init() async {
    try {
      await dotenv.load(fileName: ".env");
      supabase = await Supabase.initialize(
        url: dotenv.env['s_url'].toString(),
        anonKey: dotenv.env['anon_key'].toString(),
      );
    } catch (e) {
      print("Supabase initialization error: $e");
      throw FormatException("Error initializing Supabase: $e");
    }
  }

  static Future<User> signUp({
    required String userName,
    required String passowrd,
  }) async {
    try {
      final AuthResponse response = await supabase!.client.auth.signUp(
        password: passowrd,
        email: '$userName@gmail.com',
        data: {'user_name': userName},
      );

      final userResponse = response.user;

      if (userResponse == null) {
        throw FormatException("Sign up failed: User object is null.");
      }

      await supabase!.client.from('users').insert({
        'user_id': userResponse.id,
        'user_name': userName,
      });

      print('User signed up successfully: ${userResponse.email}');
      print('Finished sign up process.');
      return userResponse;
    } on AuthException catch (e) {
      print("Authentication Error during sign up: ${e.message}");
      throw FormatException("Authentication Error: ${e.message}");
    } catch (e) {
      print("Generic sign up error: $e");
      throw FormatException("Error during sign up: $e");
    }
  }

  static Future<User> signIn({
    required String userName,
    required String passowrd,
  }) async {
    try {
      final String email = '$userName@gmail.com';

      final AuthResponse response = await supabase!.client.auth
          .signInWithPassword(email: email, password: passowrd);

      final userResponse = response.user;

      if (userResponse == null) {
        throw FormatException(
          "Sign in failed: Invalid credentials or user not found.",
        );
      }

      print('User logged in successfully: ${userResponse.email}');

      return userResponse;
    } on AuthException catch (e) {
      print("Authentication Error during sign in: ${e.message}");
      throw FormatException("Authentication Error: ${e.message}");
    } catch (e) {
      print("Generic sign in error: $e");
      throw FormatException("Error during sign in: $e");
    }
  }

  static User? getCurrentUser() {
    return supabase?.client.auth.currentUser;
  }

  static Future<void> signOut() async {
    try {
      await supabase!.client.auth.signOut();
      print("User signed out successfully.");
    } catch (e) {
      print("Error signing out: $e");
      throw FormatException("Error signing out: $e");
    }
  }
}
