import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todoapp/navigation_button_bar/screens/nav.dart';

class Authrepo {
  // هذا كلاس الاوثريبو لازم ياخذ اوبجكت عطيته بالكور النسخة من القيت ات للسوبابيس
  final SupabaseClient supabase;

  Authrepo({required this.supabase});
  ////////////////////
  Future<void> registeruser(String password, String email) async {
    final responce = await supabase.auth.signUp(
      password: password,
      email: email,
    );
    if (responce.user != null) {
      await supabase.from('users').insert({
        'name': email,
        'email': email,
        'password': password,
      });
    } else {
      throw Exception('registration faild');
    }
  }

  //////////////////////////////
  Future<void> login(String password, String email) async {
    final responce = await supabase.auth.signInWithPassword(
      password: password,
      email: email,
    );
    if (responce.user != null) {
      log("log in sucssuful");
    } else {
      throw Exception('registration faild');
    }
  }

  ////////////////////
  Future<void> logout() async {
    await supabase.auth.signOut();
  }

  ////////////////////////
  Future<void> changepassword(String oldpassword, String newpassword) async {
    final email = supabase
        .auth
        .currentUser
        ?.email; //  المستخدم سوا دخول اول مرة فعطاه توكن الحين انا اخذ الايميل فقط
    // final sign = await Supabase.instance.client.auth.signInWithPassword(
    //   password: oldpassword,
    //   email: email,
    // );
    //هذا اتاكد بس انه نفس الباسوورد القديم

    final update = await supabase
        .from('users')
        .update({'password': newpassword})
        .eq('email', email.toString());
  }
  ///////////////////////////

  Future<void> userdata() async {
    await Supabase.instance.client.auth.currentUser;
  }
}
