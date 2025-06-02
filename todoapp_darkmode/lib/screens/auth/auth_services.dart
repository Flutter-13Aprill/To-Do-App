import 'package:supabase_flutter/supabase_flutter.dart';

class AuthServices {
final SupabaseClient _supabase = Supabase.instance.client;

// sign in with email and password
Future<AuthResponse> signInWithEmailPassword(String email, String password) async {
  try {
    final response = await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    return response;
  } on AuthException catch (e) {
    // Show this if email/password is wrong
    if (e.message.contains("Invalid login credentials")) {
      throw Exception("Can't find an account with that email or password.");
    }
    throw Exception(e.message);
  } catch (e) {
  print(" Login error: $e");
  throw Exception("Unexpected error: $e");
}

}



//sign up with email and password
Future<AuthResponse> signUpWithEmailPassword(String email, String password) async {
  final response = await _supabase.auth.signUp(
    email: email,
    password: password,
  );

  final userId = response.user?.id;

  print('🧪 Auth sign-up complete. userId: $userId');

  if (userId != null) {
    try {
      final result = await _supabase.from('users').insert({
        'id': userId,
        'email': email,
      });
      print('✅ Inserted into users table: $result');
    } catch (e) {
      print('❌ Insert failed: $e');
    }
  } else {
    print('❌ No userId returned');
  }

  return response;
}





//sign out
Future<void> signOut() async {
  await _supabase.auth.signOut();
}

// get user email
String? getCurrentUserEmail() {
  final session = _supabase.auth.currentSession;
  final user = session?.user;
  return user?.email;
}
}