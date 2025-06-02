import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/repo/supabase.dart';
import 'package:todo_list/screens/index/bloc/index_bloc.dart';
import 'package:todo_list/screens/intro/intro_screen.dart';
import 'package:todo_list/style/app_theme.dart';
import 'package:todo_list/utils/setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // await dotenv.load();
  // // WidgetsFlutterBinding.ensureInitialized();
  await SupabaseConnect.init();
  setup();

  // await Supabase.initialize(
  //   url: dotenv.env["url"].toString(),
  //   anonKey: dotenv.env["anon_key"].toString(),
  // );

  //   runApp(
  //     // Wraps the app with EasyLocalization to support multiple languages and manage translations
  //     EasyLocalization(
  //       supportedLocales: [Locale('en', 'US'), Locale('ar', 'AR')],
  //       path: 'assets/translations',
  //       fallbackLocale: Locale('en', 'US'),

  //       child:

  //       MyApp(),
  //     ),
  //   );
  // }
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'AR')],
      path: 'assets/translations',
      fallbackLocale: Locale('en', 'US'),
      child: MultiBlocProvider(
        providers: [BlocProvider<IndexBloc>(create: (_) => IndexBloc())],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      home: IntroScreen(),
    );
  }
}
