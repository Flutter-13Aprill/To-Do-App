import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:to_do_app/repo/supabase.dart';

class AuthLayer {
  bool isSignIn = false;
  String? idUser;

  signUpMethod({
    required String userName,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      print("--------3");
      final user = await SupabaseConnect.registerNewUser(
        password: password,
        userName: userName,
        confirmPassword: confirmPassword,
      );
      print("--------4");

      return user;
    } catch (_) {
      rethrow;
    }
  }
}
