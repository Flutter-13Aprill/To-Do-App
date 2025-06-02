// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'bootcamps_model.dart';

class BootcampsModelMapper extends ClassMapperBase<BootcampsModel> {
  BootcampsModelMapper._();

  static BootcampsModelMapper? _instance;
  static BootcampsModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BootcampsModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'BootcampsModel';

  static int _$id(BootcampsModel v) => v.id;
  static const Field<BootcampsModel, int> _f$id = Field('id', _$id);
  static String _$name(BootcampsModel v) => v.name;
  static const Field<BootcampsModel, String> _f$name = Field('name', _$name);
  static String _$createdAt(BootcampsModel v) => v.createdAt;
  static const Field<BootcampsModel, String> _f$createdAt =
      Field('createdAt', _$createdAt, key: r'created_at');

  @override
  final MappableFields<BootcampsModel> fields = const {
    #id: _f$id,
    #name: _f$name,
    #createdAt: _f$createdAt,
  };

  static BootcampsModel _instantiate(DecodingData data) {
    return BootcampsModel(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        createdAt: data.dec(_f$createdAt));
  }

  @override
  final Function instantiate = _instantiate;

  static BootcampsModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BootcampsModel>(map);
  }

  static BootcampsModel fromJson(String json) {
    return ensureInitialized().decodeJson<BootcampsModel>(json);
  }
}

mixin BootcampsModelMappable {
  String toJson() {
    return BootcampsModelMapper.ensureInitialized()
        .encodeJson<BootcampsModel>(this as BootcampsModel);
  }

  Map<String, dynamic> toMap() {
    return BootcampsModelMapper.ensureInitialized()
        .encodeMap<BootcampsModel>(this as BootcampsModel);
  }

  BootcampsModelCopyWith<BootcampsModel, BootcampsModel, BootcampsModel>
      get copyWith => _BootcampsModelCopyWithImpl(
          this as BootcampsModel, $identity, $identity);
  @override
  String toString() {
    return BootcampsModelMapper.ensureInitialized()
        .stringifyValue(this as BootcampsModel);
  }

  @override
  bool operator ==(Object other) {
    return BootcampsModelMapper.ensureInitialized()
        .equalsValue(this as BootcampsModel, other);
  }

  @override
  int get hashCode {
    return BootcampsModelMapper.ensureInitialized()
        .hashValue(this as BootcampsModel);
  }
}

extension BootcampsModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, BootcampsModel, $Out> {
  BootcampsModelCopyWith<$R, BootcampsModel, $Out> get $asBootcampsModel =>
      $base.as((v, t, t2) => _BootcampsModelCopyWithImpl(v, t, t2));
}

abstract class BootcampsModelCopyWith<$R, $In extends BootcampsModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, String? name, String? createdAt});
  BootcampsModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _BootcampsModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BootcampsModel, $Out>
    implements BootcampsModelCopyWith<$R, BootcampsModel, $Out> {
  _BootcampsModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BootcampsModel> $mapper =
      BootcampsModelMapper.ensureInitialized();
  @override
  $R call({int? id, String? name, String? createdAt}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (name != null) #name: name,
        if (createdAt != null) #createdAt: createdAt
      }));
  @override
  BootcampsModel $make(CopyWithData data) => BootcampsModel(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      createdAt: data.get(#createdAt, or: $value.createdAt));

  @override
  BootcampsModelCopyWith<$R2, BootcampsModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _BootcampsModelCopyWithImpl($value, $cast, t);
}
