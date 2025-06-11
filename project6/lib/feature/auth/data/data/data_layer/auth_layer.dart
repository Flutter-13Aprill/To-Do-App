import 'package:project6/core/service/supabase_connect.dart';

class AuthLayer {
  String? idUser;
  //SingUp
  signUpMethod({required String userName, required String password}) async {
    try {
      final user = await SupabaseConnect.signUp(
        userName: userName,
        password: password,
      );
      idUser = user.id;
    } catch (_) {
      rethrow;
    }
  }

  //LogIn
  logInMethod({required String userName, required String password}) async {
    try {
      final user = await SupabaseConnect.logIn(
        userName: userName,
        password: password,
      );
      idUser = user.id;
    } catch (_) {
      rethrow;
    }
  }
}
