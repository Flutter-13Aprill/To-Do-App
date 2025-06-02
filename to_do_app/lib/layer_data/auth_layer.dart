import 'package:to_do_app/repo/supabase.dart';

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
}
