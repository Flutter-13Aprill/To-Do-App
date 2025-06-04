import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app_development/Screen/Splash_Screen.dart';
import 'package:to_do_app_development/Screen/Task/bloc/task_bloc.dart';
import 'package:to_do_app_development/Screen/profile/cubit/image_cubit.dart';
import 'package:to_do_app_development/style/them_provider.dart';
import 'package:provider/provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'translations',
      fallbackLocale: Locale('en'),
       child: ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
      
      child: const MainApp(),
       ),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TaskBloc>(create: (_) => TaskBloc()),
        BlocProvider<ProfileImageCubit>(create: (_) => ProfileImageCubit()),
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
