import 'package:to_do_app/core/models/bootcamps/bootcamps_model.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:to_do_app/core/repo/supabase.dart';
part 'user_model.mapper.dart';



@MappableClass()
class UserModel with UserModelMappable {
  String? id;
  final String username;
  @MappableField(key: 'created_at')
  String? createdAt;
  
  String password;

  UserModel({
    this.id,
    this.createdAt,
    required this.username,
   required this.password,
  });

  mapForAddSupabase() {
    return {
      "username": username,
      "password": password,   
    };
  }
}
