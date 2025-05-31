import 'package:get_it/get_it.dart';
import 'package:getit/Repo/supabase_model_connect.dart';
import 'package:getit/Repo/todo_data.dart';

setup() async {
  // Alternatively you could write it if you don't like global variables
  GetIt.I.registerSingletonAsync<SupabaseConnect>(() async {
    SupabaseConnect supabaseConnect = SupabaseConnect();
    await supabaseConnect.init();
    return supabaseConnect;
  });
  GetIt.I.registerSingleton<TodoData>(TodoData());
}
