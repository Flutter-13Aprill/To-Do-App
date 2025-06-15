import 'package:get_it/get_it.dart';
import 'package:project7/repo/supabase.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<SupabaseRepo>(SupabaseRepo());
}
