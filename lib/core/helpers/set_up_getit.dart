import 'package:get_it/get_it.dart';
import 'package:uptodo/features/authentication/data/auth_data_layer.dart';
import 'package:uptodo/features/home/data/data_layer/task_data_layer.dart';

void setUpGetIt(){

  GetIt.I.registerSingletonAsync<AuthDataLayer>(() async =>  AuthDataLayer());

  GetIt.I.registerSingletonAsync<TaskDataLayer>(() async => TaskDataLayer());
}