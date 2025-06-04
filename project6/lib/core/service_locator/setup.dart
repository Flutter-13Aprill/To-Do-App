import 'package:get_it/get_it.dart';
import 'package:project6/core/service/local_storage.dart';
import 'package:project6/feature/auth/data/data/data_layer/auth_layer.dart';

Future<void> setup() async {
  //
  GetIt.I.registerSingletonAsync<LocalStorage>(() async {
    final localStorage = LocalStorage();
    await localStorage.init();
    localStorage.getCategoryList();
    print(localStorage.categories);
    return localStorage;
  });

  GetIt.I.registerSingleton<AuthLayer>(AuthLayer());
}
