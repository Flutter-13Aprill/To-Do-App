import 'package:get_it/get_it.dart';
import 'package:uptodo/features/Authentication/data/auth_data_layer.dart';

void setUpGetIt(){

  GetIt.I.registerSingletonAsync<AuthDataLayer>(() async =>  AuthDataLayer());
}