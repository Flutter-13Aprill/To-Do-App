import 'package:dart_mappable/dart_mappable.dart';

part 'user_model.mapper.dart';

@MappableClass()
class UserModel with UserModelMappable {
  final String userName;

  UserModel({required this.userName});
}
