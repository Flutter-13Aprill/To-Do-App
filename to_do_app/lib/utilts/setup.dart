import 'package:get_it/get_it.dart';
import 'package:to_do_app/layer_data/app_data.dart';
import 'package:to_do_app/layer_data/auth_layer.dart';

void setup() async {
  GetIt.I.registerSingletonAsync<AppDataLayer>(
    () async => AppDataLayer()..loadDataFromSupabase(),
  );

  GetIt.I.registerSingleton<AuthLayer>(AuthLayer());
}
