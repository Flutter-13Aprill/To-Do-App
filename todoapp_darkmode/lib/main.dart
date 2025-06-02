import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todoapp_darkmode/core/setup_locator.dart';
import 'package:todoapp_darkmode/screens/auth/auth_services.dart';

import 'package:todoapp_darkmode/screens/auth/create_account/register_page.dart';
import 'package:todoapp_darkmode/screens/auth/login/bloc/login_bloc.dart';
import 'package:todoapp_darkmode/screens/auth/login/login_page.dart';
import 'package:todoapp_darkmode/screens/home_screens/home_screens.dart';

import 'package:todoapp_darkmode/screens/intro/intro_screen1/intro_screen1.dart';
import 'package:todoapp_darkmode/screens/intro/intro_screen2/intro_screen2.dart';
import 'package:todoapp_darkmode/screens/intro/intro_screen3/intro_screen3.dart';
import 'package:todoapp_darkmode/screens/intro/intro_screen4/intro_screen4.dart';
import 'package:todoapp_darkmode/screens/intro/intro_screen5/intro_screen5.dart';




void main() async{

   WidgetsFlutterBinding.ensureInitialized();
   await Supabase.initialize(
  anonKey: "",
  url: "",
);
 setupLocator(); 
runApp(const MyApp());

}

class MyApp extends StatelessWidget {

const MyApp({super.key});



@override

Widget build(BuildContext context) {

return MaterialApp(

debugShowCheckedModeBanner: false,


      initialRoute: '/intro1',
routes: {
'/intro1': (context) => const IntroScreen1(),
'/intro2': (context) => const IntroScreen2(),
'/intro3': (context) => const IntroScreen3(),
'/intro4': (context) => const IntroScreen4(),
'/intro5': (context) => const IntroScreen5(),
'/login': (context) => BlocProvider(
  create: (_) => LoginBloc(AuthServices()),
  child: const LoginPage(),
),



   '/signin': (context) => buildRegisterPageWithBloc(),


'/home': (context) => const HomeScreens(),
}
);

}

}