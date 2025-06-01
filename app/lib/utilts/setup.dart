import 'package:app/layer_data/app_datat.dart';
import 'package:app/layer_data/auth_layer.dart';
import 'package:get_it/get_it.dart';

void setUp() async {
  GetIt.I.registerSingleton<AuthLayer>(AuthLayer());
  GetIt.I.registerLazySingleton<AppDatatLayer>(() => AppDatatLayer());
}
