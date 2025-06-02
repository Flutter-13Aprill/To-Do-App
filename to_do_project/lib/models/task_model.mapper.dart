// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'task_model.dart';

class TaskModelMapper extends ClassMapperBase<TaskModel> {
  TaskModelMapper._();

  static TaskModelMapper? _instance;
  static TaskModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TaskModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TaskModel';

  static String _$id(TaskModel v) => v.id;
  static const Field<TaskModel, String> _f$id = Field('id', _$id);
  static String _$taske(TaskModel v) => v.taske;
  static const Field<TaskModel, String> _f$taske = Field('taske', _$taske);
  static String _$description(TaskModel v) => v.description;
  static const Field<TaskModel, String> _f$description =
      Field('description', _$description);
  static DateTime _$selectedTime(TaskModel v) => v.selectedTime;
  static const Field<TaskModel, DateTime> _f$selectedTime =
      Field('selectedTime', _$selectedTime);
  static DateTime _$createdAt(TaskModel v) => v.createdAt;
  static const Field<TaskModel, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt);

  @override
  final MappableFields<TaskModel> fields = const {
    #id: _f$id,
    #taske: _f$taske,
    #description: _f$description,
    #selectedTime: _f$selectedTime,
    #createdAt: _f$createdAt,
  };

  static TaskModel _instantiate(DecodingData data) {
    return TaskModel(
        id: data.dec(_f$id),
        taske: data.dec(_f$taske),
        description: data.dec(_f$description),
        selectedTime: data.dec(_f$selectedTime),
        createdAt: data.dec(_f$createdAt));
  }

  @override
  final Function instantiate = _instantiate;

  static TaskModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TaskModel>(map);
  }

  static TaskModel fromJson(String json) {
    return ensureInitialized().decodeJson<TaskModel>(json);
  }
}

mixin TaskModelMappable {
  String toJson() {
    return TaskModelMapper.ensureInitialized()
        .encodeJson<TaskModel>(this as TaskModel);
  }

  Map<String, dynamic> toMap() {
    return TaskModelMapper.ensureInitialized()
        .encodeMap<TaskModel>(this as TaskModel);
  }

  TaskModelCopyWith<TaskModel, TaskModel, TaskModel> get copyWith =>
      _TaskModelCopyWithImpl<TaskModel, TaskModel>(
          this as TaskModel, $identity, $identity);
  @override
  String toString() {
    return TaskModelMapper.ensureInitialized()
        .stringifyValue(this as TaskModel);
  }

  @override
  bool operator ==(Object other) {
    return TaskModelMapper.ensureInitialized()
        .equalsValue(this as TaskModel, other);
  }

  @override
  int get hashCode {
    return TaskModelMapper.ensureInitialized().hashValue(this as TaskModel);
  }
}

extension TaskModelValueCopy<$R, $Out> on ObjectCopyWith<$R, TaskModel, $Out> {
  TaskModelCopyWith<$R, TaskModel, $Out> get $asTaskModel =>
      $base.as((v, t, t2) => _TaskModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TaskModelCopyWith<$R, $In extends TaskModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? id,
      String? taske,
      String? description,
      DateTime? selectedTime,
      DateTime? createdAt});
  TaskModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TaskModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TaskModel, $Out>
    implements TaskModelCopyWith<$R, TaskModel, $Out> {
  _TaskModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TaskModel> $mapper =
      TaskModelMapper.ensureInitialized();
  @override
  $R call(
          {String? id,
          String? taske,
          String? description,
          DateTime? selectedTime,
          DateTime? createdAt}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (taske != null) #taske: taske,
        if (description != null) #description: description,
        if (selectedTime != null) #selectedTime: selectedTime,
        if (createdAt != null) #createdAt: createdAt
      }));
  @override
  TaskModel $make(CopyWithData data) => TaskModel(
      id: data.get(#id, or: $value.id),
      taske: data.get(#taske, or: $value.taske),
      description: data.get(#description, or: $value.description),
      selectedTime: data.get(#selectedTime, or: $value.selectedTime),
      createdAt: data.get(#createdAt, or: $value.createdAt));

  @override
  TaskModelCopyWith<$R2, TaskModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TaskModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
