import 'package:todo_list/repo/supabase.dart';

class AuthLayer {
  bool isSignIn = false;
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

  Future<void> signInMethod({
    required String email,
    required String password,
  }) async {
    try {
      final user = await SupabaseConnect.signIn(
        email: email,
        password: password,
      );
      idUser = user.id;
      isSignIn = true;
    } catch (_) {
      rethrow;
    }
  }
}
