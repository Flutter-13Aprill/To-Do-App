import 'package:todo_app/repo/supabase.dart';

/// AuthLayer handles user authentication processes including sign-up and log-in
/// by interacting with the Supabase backend.

class AuthLayer {
  String? idUser;

  signUpMethod({required String email, required String password}) async {
    try {
      final user = await SupabaseConnect.signUp(
        email: email,
        password: password,
      );
      idUser = user.id;
    } catch (_) {
      rethrow;
    }
  }

  logInMethod({required String email, required String password}) async {
    try {
      final user = await SupabaseConnect.logIn(
        email: email,
        password: password,
      );
      idUser = user.id;
    } catch (_) {
      rethrow;
    }
  }
}
