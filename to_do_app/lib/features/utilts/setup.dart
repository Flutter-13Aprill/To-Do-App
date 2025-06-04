import 'package:to_do_app/features/layer_data/app_data.dart';
import 'package:to_do_app/features/layer_data/auth_layer.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_app/features/utilts/services/CategoryService.dart';
import 'package:to_do_app/features/utilts/services/TaskService.dart';

Future<void> setup() async {
  GetIt.I.registerSingletonAsync<AppDataLayer>(
    () async => AppDataLayer()
      
   
  );
   GetIt.I.registerSingleton<TaskService>(TaskService());
 GetIt.I.registerSingleton<CategoryService>(CategoryService());
  GetIt.I.registerSingleton<AuthLayer>(AuthLayer());
}
