import 'package:get_it/get_it.dart';
import 'package:to_do_project/featuers/auth/data/data_layer/auth_layer.dart';

void setup() async {
  GetIt.I.registerSingleton<AuthLayer>(AuthLayer());
}
