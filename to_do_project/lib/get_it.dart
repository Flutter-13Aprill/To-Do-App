import 'package:get_it/get_it.dart';
import 'package:to_do_project/features/intro/splash/bloc/splash_bloc.dart';

final GetIt getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerFactory(() => IntroBloc());
}
