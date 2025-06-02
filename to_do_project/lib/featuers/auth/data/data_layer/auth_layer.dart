import 'package:to_do_project/core/repo/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthLayer {
  String? idUser;
  User? _currentUser;

  User? get currentUser => _currentUser;

  signUpMethod({required String userName, required String passowrd}) async {
    try {
      final user = await SupabaseStart.signUp(
        userName: userName,
        passowrd: passowrd,
      );
      idUser = user.id;
      _currentUser = user;
    } catch (_) {
      rethrow;
    }
  }

  signInMethod({required String userName, required String passowrd}) async {
    try {
      final user = await SupabaseStart.signIn(
        userName: userName,
        passowrd: passowrd,
      );
      _currentUser = user;
      idUser = user.id;
    } catch (_) {
      rethrow;
    }
  }

  signOutMethod() async {
    try {
      await SupabaseStart.signOut();
      _currentUser = null;
      idUser = null;
    } catch (_) {
      rethrow;
    }
  }

  bool isLoggedIn() {
    return _currentUser != null;
  }
}
