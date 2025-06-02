import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/repo/supabase.dart';
import 'package:to_do_app/core/theme/app_theme.dart';
import 'package:to_do_app/features/bottom_controller/bottom_nav_screen.dart';
import 'package:to_do_app/features/index/widgets/date_widget/bloc/calendar_bloc.dart';
import 'package:to_do_app/features/loading/bloc/loading_bloc.dart';
import 'package:to_do_app/features/splash/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:to_do_app/features/utilts/setup.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SupabaseConnect.init();
  setup();
  await SupabaseConnect.getUsersData();
 runApp(
  
    EasyLocalization(
      supportedLocales: [Locale('ar'),Locale('en')],
      path: 'lib/core/text/translations',
      fallbackLocale: Locale('en'),
      child: const MainApp(),
    ),
  );

}
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoadingBloc>(
          create: (BuildContext context) => LoadingBloc(),
        ),
      ],child:MaterialApp(
      
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
       theme: AppTheme.theme,
      home: const SplashScreen()
    ));
  }
}
