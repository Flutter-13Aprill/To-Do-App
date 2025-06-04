import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/loading/bloc/loading_bloc.dart';
import 'package:todo_app/features/loading/loading_screen.dart';
import 'package:todo_app/repo/supabase.dart';
import 'package:todo_app/style/theme/theme.dart';
import 'package:todo_app/utilities/setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseConnect.init();
  await EasyLocalization.ensureInitialized();
  setup();
  runApp(
    EasyLocalization(
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ar', 'AR'),
      ], // Supported languages
      path: 'assets/translations',
      fallbackLocale: Locale('en', 'US'),
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoadingBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: CustomTheme.darkTheme,
        home: LoadingScreen(),
      ),
    );
  }
}
