import 'package:get_it/get_it.dart';
import 'package:todo_app/repository/supabase.dart';

void setup() {
  GetIt.I.registerLazySingleton<SupabaseConnect>(() => SupabaseConnect());
}
