import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/di/locetor.dart';
import 'package:todoapp/index_home/bloc/task_bloc.dart';
import 'package:todoapp/intro/Screens/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:todoapp/repo/supabase.dart';
import 'package:todoapp/theems/theems.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
BuildContext get globalContext => navigatorKey.currentContext!;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseConnect.init();
  initDi();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'AR')],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('en', 'US'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(),
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: CustomeTheem.todoapp,
        home: SplashScreen(),
      ),
    );
  }
}
