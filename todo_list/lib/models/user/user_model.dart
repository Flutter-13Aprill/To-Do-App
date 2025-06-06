import 'package:dart_mappable/dart_mappable.dart';

part 'user_model.mapper.dart';

@MappableClass()
class UserModel with UserModelMappable {
  String? id;
  final String email;
  @MappableField(key: 'created_at')
  String? createdAt;

  UserModel({this.id, this.createdAt, required this.email});

  mapForAddSupabase() {
    return {"email": email};
  }
}
