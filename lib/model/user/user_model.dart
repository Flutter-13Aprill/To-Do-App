import 'package:dart_mappable/dart_mappable.dart';

part 'user_model.mapper.dart';

@MappableClass()
class UserModel with UserModelMappable {
  final int id;

  @MappableField(key: 'user_name')
  final String username;
  final String password;

  UserModel({required this.id, required this.username, required this.password});
}
