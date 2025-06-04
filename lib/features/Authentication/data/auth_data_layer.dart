import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uptodo/core/connection_supabase.dart';
import 'package:uptodo/features/authentication/data/repositories/auth_repository.dart';

class AuthDataLayer {



  Future<void> getItSignUp({required String username, required String password}) async{

    try{
      
      final authResponse = await AuthRepository.signUpWithUsernamePassword(username: username, password: password);
     
      ConnectionSupabase.user = authResponse.user;
      
    }on AuthApiException catch(error){
      log('*** Auth API Exception - Getit Sign Up ***\nCode: ${error.code}\nMessage: ${error.message}');
      throw Exception(error.message);
    }catch(error){
      log('*** Exception - Getit Sign Up ***\nMessage: ${error.toString()}');
      throw Exception(error);
    }
  }

  Future<void> getItSignIn({required String username, required String password}) async {
    
    try{
      final authResponse = await AuthRepository.signInWithUsernamePassword(username: username, password: password);
      ConnectionSupabase.user = authResponse.user;
    }on AuthApiException catch(error){
      log('*** Auth API Exception - Getit Sign In ***\nCode: ${error.code}\nMessage: ${error.message}');
      Exception(error.message);
    }catch(error){
      throw Exception(error);
    }
  }
}