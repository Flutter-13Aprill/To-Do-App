import 'dart:developer';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConnect {
  static SupabaseClient? supabase; 

  static Future<void> init() async {
    log('start Supabase init');
    try {
      await dotenv.load(fileName: '.env');
      
      await Supabase.initialize(
        anonKey: dotenv.env['anon_key'].toString(),
        url: dotenv.env['s_url'].toString(),
      );

      supabase = Supabase.instance.client;

      log('end Supabase init');
      log('supabase client: $supabase');
    } catch (e) {
      log('Error in Supabase init: $e');
      throw FormatException('error in db initialization: $e');
    }
  }

  static Future<bool> checkIfUsernameExistsInDb(String username) async {
    try {
      final response = await supabase!
          .from('user_profiles') 
          .select('username')
          .eq('username', username)
          .limit(1);

      return response.isNotEmpty;
    } catch (e) {
      print("Error checking username existence in DB: $e");
      return true; // أو false إذا أردت منع التسجيل في حالة الخطأ
    }
  }

  static Future<void> insertUserProfile(String userId, String username) async {
    try {
      await supabase!
          .from('user_profiles')
          .insert({'id': userId, 'username': username});
      print("User profile inserted successfully for user: $userId, username: $username");
    } catch (e) {
      print("Error inserting user profile: $e");
      rethrow;
    }
  }

  static Future<AuthResponse> signUp({
    required String email,
    required String password,
    Map<String, dynamic>? data,
  }) async {
    try {
      print("SupabaseConnect: Calling Supabase signUp with email: $email");
      final AuthResponse response = await supabase!.auth.signUp(
        email: email,
        password: password,
        data: data,
      );
      print("SupabaseConnect: SignUp successful for user: ${response.user?.id ?? 'N/A'}");
      return response;
    } on AuthException catch (error) {
      print("Supabase Auth Error: ${error.message}");
      throw AuthException(error.message, statusCode: error.statusCode);
    } catch (error) {
      print("Supabase General Error in signUp: $error");
      throw Exception("There was an error during signup: $error");
    }
  }

  // **** إضافة دالة signIn هنا ****
  static Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    try {
      print("SupabaseConnect: Calling Supabase signInWithPassword for email: $email");
      final AuthResponse response = await supabase!.auth.signInWithPassword(
        email: email,
        password: password,
      );
      print("SupabaseConnect: SignIn successful for user: ${response.user?.id ?? 'N/A'}");
      return response;
    } on AuthException catch (error) {
      print("Supabase Auth Error (SignIn): ${error.message}");
      throw AuthException(error.message, statusCode: error.statusCode);
    } catch (error) {
      print("Supabase General Error in signIn: $error");
      throw Exception("There was an error during signin: $error");
    }
  }
}