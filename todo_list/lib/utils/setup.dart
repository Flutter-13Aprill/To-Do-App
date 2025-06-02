import 'package:get_it/get_it.dart';
import 'package:todo_list/layer_data/auth_layer.dart';

void setup() async {
  GetIt.I.registerSingleton<AuthLayer>(AuthLayer());
}
