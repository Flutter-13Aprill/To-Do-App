import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uptodo/core/connection_supabase.dart';

class AuthDataLayer {

  User? user;

  Future<void> getItSignUp({required String username, required String password}) async{

    try{

      final authResponse = await ConnectionSupabase.signInWithUsernamePassword(username: username, password: password);
      user = authResponse.user;
      
    }on AuthApiException catch(error){
      log('*** Auth API Exception - Getit Sign Up ***\nCode: ${error.code}\nMessage: ${error.message}');
    }catch(error){
      log('*** Exception - Getit Sign Up ***\nMessage: ${error.toString()}');
    }
  }

  Future<void> getItSignIn({required String username, required String password}) async {
    
    try{
      final authResponse = await ConnectionSupabase.signInWithUsernamePassword(username: username, password: password);
      user = authResponse.user;
    }on AuthApiException catch(error){
      log('*** Auth API Exception - Getit Sign In ***\nCode: ${error.code}\nMessage: ${error.message}');
    }
  }
}