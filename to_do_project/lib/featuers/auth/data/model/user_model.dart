import 'package:dart_mappable/dart_mappable.dart';
part 'user_model.mapper.dart';

@MappableClass()
class UserModel with UserModelMappable {
  final String? confermPass;
  final String userName;
  final String passowrd;

  UserModel({this.confermPass, required this.userName, required this.passowrd});
}
