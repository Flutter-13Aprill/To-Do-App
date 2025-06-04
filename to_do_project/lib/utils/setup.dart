// TODO Implement this library.
import 'package:get_it/get_it.dart';
import 'package:to_do_project/data_layer/auth_layer.dart';
void setup() {
  GetIt.I.registerSingleton<AuthLayer>(AuthLayer());

}