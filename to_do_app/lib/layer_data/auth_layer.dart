import 'package:to_do_app/repo/supabase.dart';

class AuthLayer {
  bool isSignIn = false;
  int? idUser;

  signUpMethod({
    required String userName,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final user = await SupabaseConnect.registerNewUser(
        password: password,
        userName: userName,
        confirmPassword: confirmPassword,
      );
      if (user == null) {
        return true;
      }
      return false;
    } catch (_) {
      rethrow;
    }
  }

  signInMethod({required String userName, required String password}) async {
    try {
      final user = await SupabaseConnect.signInUser(
        password: password,
        userName: userName,
      );
      if (userName == user?['username'] && password == user?['password']) {
        idUser = user?['id'];
        return true;
      } else {
        return false;
      }
    } catch (_) {
      rethrow;
    }
  }
}
