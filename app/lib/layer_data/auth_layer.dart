import 'package:app/repo/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthLayer {
  bool isSignIn = false;
  String? idUser;

  // تستقبل email (البريد الوهمي) و password و username (اسم المستخدم الحقيقي)
  signUpMethod({required String email, required String password, String? username}) async {
    try {
      print("AuthLayer: Attempting signUp for email: $email, username: $username");
      // تمرير اسم المستخدم كـ data (user_metadata) إلى Supabase
      final AuthResponse response = await SupabaseConnect.signUp(
        email: email,
        password: password,
        data: username != null ? {'username': username} : null,
      );
      idUser = response.user?.id;
      print("AuthLayer: User signed up successfully with ID: ${idUser ?? 'N/A'}");
    } on AuthException catch (e) {
      print("AuthLayer Auth Error: ${e.message}");
      rethrow; // إعادة رمي الخطأ لـ BLoC
    } catch (e) {
      print("AuthLayer General Error: $e");
      rethrow; // إعادة رمي أي خطأ آخر
    }
  }
  
  // **** هذا هو التعديل الأساسي لدالة signInMethod ****
  signInMethod({required String username, required String password}) async {
    try {
      // بناء البريد الإلكتروني الوهمي بنفس المنطق المستخدم في التسجيل (toLowerCase + replaceAll)
      // هذا يضمن أن البريد الإلكتروني الذي يتم محاولة تسجيل الدخول به يطابق تمامًا ما تم تخزينه في Supabase Auth.
      final String dummyEmail = '${username.toLowerCase().replaceAll(RegExp(r'\s+'), '')}@gmail.com';
      print("AuthLayer: Attempting signIn for dummy email: $dummyEmail");

      final AuthResponse response = await SupabaseConnect.signIn(
        email: dummyEmail,
        password: password,
      );
      idUser = response.user?.id;
      isSignIn = true; // تحديث حالة تسجيل الدخول

      print("AuthLayer: User signed in successfully with ID: ${idUser ?? 'N/A'}");
    } on AuthException catch (e) {
      print("AuthLayer Auth Error (SignIn): ${e.message}");
      isSignIn = true; // تحديث حالة تسجيل الدخول
      rethrow; // إعادة رمي الخطأ لـ BLoC
    } catch (e) {
      print("AuthLayer General Error (SignIn): $e");
      isSignIn = false; // تحديث حالة تسجيل الدخول
      rethrow; // إعادة رمي أي خطأ آخر
    }
  }
}