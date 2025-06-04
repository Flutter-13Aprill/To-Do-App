// import 'package:boot_app/repo/supabase.dart';

import 'package:to_do_project/repos/supabase.dart';

class AuthLayer {
  bool isSignIn = false;
  String? idUser;

  signUpMethod({required String email, required String password}) async {
    try {
      print("--------3");
      final user = await SupabaseConnect.signUp(
        email: email,
        password: password,
      );
      idUser = user.id;
      print("--------4");
    } catch (_) {
      rethrow;
    }
  }
}