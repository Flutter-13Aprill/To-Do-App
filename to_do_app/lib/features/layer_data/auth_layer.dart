import 'package:to_do_app/core/repo/supabase.dart';

class AuthLayer {
  bool isSignIn = false;
  String? idUser;

  addUser({required String username, required String password}) async {
    try {
      
      final user = await SupabaseConnect.addNewUser(
        username: username,
        password: password,
      );
      
      
    } catch (_) {
      rethrow;
    }
  }
}
