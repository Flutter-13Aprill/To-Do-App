// Auth gate- thsi will continously listen for auth state changes

//unauthentication -> log in page
//authentication -> profile page


import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todoapp_darkmode/screens/auth/login/login_page.dart';
import 'package:todoapp_darkmode/screens/home_screens/home_screens.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      // listen to auth state changes
      stream: Supabase.instance.client.auth.onAuthStateChange,
      
      //build appropiate page based on auth state
      builder: (context, snapshot){
        //loading
        if (snapshot.connectionState  == ConnectionState.waiting) {
          return const Scaffold(
            body: Center( child: CircularProgressIndicator()),
          
          );
        }
        final session  = snapshot.hasData ? snapshot.data!.session : null;

        if( session != null){
          return HomeScreens(); 
        }else {
          return LoginPage();
        }
      },

    
      
    );
  }
}