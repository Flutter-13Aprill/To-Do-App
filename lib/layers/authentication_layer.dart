import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:to_do_list/repositories/supabase.dart';

class AuthenticationLayer {
  String? userId;
  userSignUp(email, password) async {
    final user = await SupabaseConnect.signUp(email: email, password: password);
    userId = user.id;
  }
}
