import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:to_do_app/core/theme/app_theme.dart';
import 'package:to_do_app/localization/localization_helper.dart';
import 'package:to_do_app/features/intro/screens/splash_screen.dart';
import 'package:to_do_app/features/intro/screens/onboarding_screen.dart';
import 'package:to_do_app/features/intro/screens/start_screen.dart';
import 'package:to_do_app/features/auth/screens/login_screen.dart';
import 'package:to_do_app/features/auth/screens/register_screen.dart';
import 'package:to_do_app/features/home/screens/home_screen.dart';
import 'package:to_do_app/features/tasks/bloc/bloc/tasks_bloc.dart';
import 'package:to_do_app/data/services/supabase_service.dart';
import 'package:to_do_app/data/repositories/task_repository.dart';

final getIt = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://rjthvmrfcjqxnpgewpsx.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJqdGh2bXJmY2pxeG5wZ2V3cHN4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDg4MzI1NTEsImV4cCI6MjA2NDQwODU1MX0.g3-F17TMaYo_2rqI7bFXyymOI6kBm_mDMgZ1GLFM3N8',
  );

  setupLocator();

  runApp(const MyAppWrapper());
}

void setupLocator() {
  getIt.registerLazySingleton(() => Supabase.instance.client);
  getIt.registerLazySingleton(() => SupabaseService());
  getIt.registerLazySingleton(() => TaskRepository());
}

class MyAppWrapper extends StatelessWidget {
  const MyAppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => TasksBloc(taskRepository: getIt<TaskRepository>()),
        ),
      ],
      child: const UpTodoApp(),
    );
  }
}

class UpTodoApp extends StatelessWidget {
  const UpTodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UpTodo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      locale: const Locale('en'),
      supportedLocales: const [Locale('en'), Locale('ar')],
      // localizationsDelegates: [...],
      initialRoute: '/splash',
      routes: {
        '/splash': (_) => const SplashScreen(),
        '/onboarding': (_) => const OnboardingScreen(),
        '/start': (_) => const StartScreen(),
        '/login': (_) => const LoginScreen(),
        '/register': (_) => const RegisterScreen(),
        '/home': (_) => const HomeScreen(),
      },
    );
  }
}
