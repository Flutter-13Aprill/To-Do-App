import 'package:project6/repo/supabase.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

class AuthLayer {
  bool isSignIn = false;
  String? idUser;

  signUpMethod({required String username, required password}) async {
    try {
      final user = await SupabaseConnect.signup(
        username: username,
        password: password,
      );

      idUser = user.id;
    } catch (_) {
      rethrow;
    }
  }
  loginMethod({required String username, required password}) async {
    try {
      final user = await SupabaseConnect.signup(
        username: username,
        password: password,
      );

      idUser = user.id;
    } catch (_) {
      rethrow;
    }
  }
}
