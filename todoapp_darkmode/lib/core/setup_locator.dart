import 'package:get_it/get_it.dart';
import 'package:todoapp_darkmode/data/repo/task_repository_impl.dart';
import 'package:todoapp_darkmode/data/repo/task_repsitory.dart';
import 'package:todoapp_darkmode/screens/home_screens/bloc/home_bloc.dart';


final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<TaskRepository>(() => TaskRepositoryImpl());
  locator.registerFactory(() => HomeBloc());
}

