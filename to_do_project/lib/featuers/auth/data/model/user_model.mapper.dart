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

  static String? _$confermPass(UserModel v) => v.confermPass;
  static const Field<UserModel, String> _f$confermPass = Field(
    'confermPass',
    _$confermPass,
    opt: true,
  );
  static String _$userName(UserModel v) => v.userName;
  static const Field<UserModel, String> _f$userName = Field(
    'userName',
    _$userName,
  );
  static String _$passowrd(UserModel v) => v.passowrd;
  static const Field<UserModel, String> _f$passowrd = Field(
    'passowrd',
    _$passowrd,
  );

  @override
  final MappableFields<UserModel> fields = const {
    #confermPass: _f$confermPass,
    #userName: _f$userName,
    #passowrd: _f$passowrd,
  };

  static UserModel _instantiate(DecodingData data) {
    return UserModel(
      confermPass: data.dec(_f$confermPass),
      userName: data.dec(_f$userName),
      passowrd: data.dec(_f$passowrd),
    );
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
    return UserModelMapper.ensureInitialized().encodeJson<UserModel>(
      this as UserModel,
    );
  }

  Map<String, dynamic> toMap() {
    return UserModelMapper.ensureInitialized().encodeMap<UserModel>(
      this as UserModel,
    );
  }

  UserModelCopyWith<UserModel, UserModel, UserModel> get copyWith =>
      _UserModelCopyWithImpl<UserModel, UserModel>(
        this as UserModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return UserModelMapper.ensureInitialized().stringifyValue(
      this as UserModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return UserModelMapper.ensureInitialized().equalsValue(
      this as UserModel,
      other,
    );
  }

  @override
  int get hashCode {
    return UserModelMapper.ensureInitialized().hashValue(this as UserModel);
  }
}

extension UserModelValueCopy<$R, $Out> on ObjectCopyWith<$R, UserModel, $Out> {
  UserModelCopyWith<$R, UserModel, $Out> get $asUserModel =>
      $base.as((v, t, t2) => _UserModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UserModelCopyWith<$R, $In extends UserModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? confermPass, String? userName, String? passowrd});
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
  $R call({Object? confermPass = $none, String? userName, String? passowrd}) =>
      $apply(
        FieldCopyWithData({
          if (confermPass != $none) #confermPass: confermPass,
          if (userName != null) #userName: userName,
          if (passowrd != null) #passowrd: passowrd,
        }),
      );
  @override
  UserModel $make(CopyWithData data) => UserModel(
    confermPass: data.get(#confermPass, or: $value.confermPass),
    userName: data.get(#userName, or: $value.userName),
    passowrd: data.get(#passowrd, or: $value.passowrd),
  );

  @override
  UserModelCopyWith<$R2, UserModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _UserModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
