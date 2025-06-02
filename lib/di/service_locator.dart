import 'package:get_it/get_it.dart';
import 'package:to_do_app/data/repositories/task_repository.dart';
import 'package:to_do_app/data/services/supabase_service.dart';

final sl = GetIt.instance;

void setupLocator() {
  sl.registerLazySingleton(() => SupabaseService());
  sl.registerLazySingleton(() => TaskRepository());
}
