import 'package:get_it/get_it.dart';
import 'package:project6/layer_data/app_data.dart';
import 'package:project6/layer_data/auth_layer.dart';

void setup() async{

GetIt.I.registerSingleton<AuthLayer>(AuthLayer());



}