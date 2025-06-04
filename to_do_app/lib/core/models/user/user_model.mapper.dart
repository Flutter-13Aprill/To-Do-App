// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user_model.dart';

class UserModelMapper extends ClassMapperBase<UserModel> {
  UserModelMapper._();

  static UserModelMapper? _instance;
  static UserModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UserModel';

  static String? _$id(UserModel v) => v.id;
  static const Field<UserModel, String> _f$id = Field('id', _$id, opt: true);
  static String? _$createdAt(UserModel v) => v.createdAt;
  static const Field<UserModel, String> _f$createdAt =
      Field('createdAt', _$createdAt, key: r'created_at', opt: true);
  static String _$username(UserModel v) => v.username;
  static const Field<UserModel, String> _f$username =
      Field('username', _$username);
  static String _$password(UserModel v) => v.password;
  static const Field<UserModel, String> _f$password =
      Field('password', _$password);

  @override
  final MappableFields<UserModel> fields = const {
    #id: _f$id,
    #createdAt: _f$createdAt,
    #username: _f$username,
    #password: _f$password,
  };

  static UserModel _instantiate(DecodingData data) {
    return UserModel(
        id: data.dec(_f$id),
        createdAt: data.dec(_f$createdAt),
        username: data.dec(_f$username),
        password: data.dec(_f$password));
  }

  @override
  final Function instantiate = _instantiate;

  static UserModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserModel>(map);
  }

  static UserModel fromJson(String json) {
    return ensureInitialized().decodeJson<UserModel>(json);
  }
}

mixin UserModelMappable {
  String toJson() {
    return UserModelMapper.ensureInitialized()
        .encodeJson<UserModel>(this as UserModel);
  }

  Map<String, dynamic> toMap() {
    return UserModelMapper.ensureInitialized()
        .encodeMap<UserModel>(this as UserModel);
  }

  UserModelCopyWith<UserModel, UserModel, UserModel> get copyWith =>
      _UserModelCopyWithImpl(this as UserModel, $identity, $identity);
  @override
  String toString() {
    return UserModelMapper.ensureInitialized()
        .stringifyValue(this as UserModel);
  }

  @override
  bool operator ==(Object other) {
    return UserModelMapper.ensureInitialized()
        .equalsValue(this as UserModel, other);
  }

  @override
  int get hashCode {
    return UserModelMapper.ensureInitialized().hashValue(this as UserModel);
  }
}

extension UserModelValueCopy<$R, $Out> on ObjectCopyWith<$R, UserModel, $Out> {
  UserModelCopyWith<$R, UserModel, $Out> get $asUserModel =>
      $base.as((v, t, t2) => _UserModelCopyWithImpl(v, t, t2));
}

abstract class UserModelCopyWith<$R, $In extends UserModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, String? createdAt, String? username, String? password});
  UserModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserModel, $Out>
    implements UserModelCopyWith<$R, UserModel, $Out> {
  _UserModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserModel> $mapper =
      UserModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? createdAt = $none,
          String? username,
          String? password}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (createdAt != $none) #createdAt: createdAt,
        if (username != null) #username: username,
        if (password != null) #password: password
      }));
  @override
  UserModel $make(CopyWithData data) => UserModel(
      id: data.get(#id, or: $value.id),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      username: data.get(#username, or: $value.username),
      password: data.get(#password, or: $value.password));

  @override
  UserModelCopyWith<$R2, UserModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserModelCopyWithImpl($value, $cast, t);
}
