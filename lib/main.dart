<<<<<<< HEAD
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
=======
import 'package:flutter/material.dart';
import 'package:to_do_app_development/Screen/Splash_Screen.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app_development/Screen/Task/bloc/task_bloc.dart';

void main() {
  runApp(Provider<TaskBloc>(create: (_) => TaskBloc(), child: const MainApp()));
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
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
=======
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
    );
  }
}
