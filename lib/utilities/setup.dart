import 'package:get_it/get_it.dart';
import 'package:to_do_list/layers/AppModel.dart';

void setup() async {
  GetIt.I.registerSingletonAsync<AppModelLayer>(
    () async => AppModelLayer()
      ..loadTasksData()
      ..loadUserData(),
  );
}
