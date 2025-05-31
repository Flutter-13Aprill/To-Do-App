import 'package:get_it/get_it.dart';
import 'package:project6/core/service/local_storage.dart';

Future<void> setup() async {
  final localStorage = LocalStorage();
  await localStorage.init();//
  GetIt.I.registerSingleton<LocalStorage>(localStorage);
}
