import 'package:dart_mappable/dart_mappable.dart';

part 'user_model.mapper.dart';

@MappableClass()
class UserModel with UserModelMappable {
  final String userName;
  final String password;
  final String? confirmPassword;

  UserModel({
    required this.userName,
    required this.password,
    this.confirmPassword,
  });

  addToSupabase() {
    // Add user to supabase
    return {'user_name': userName, 'password': password};
  }
}
