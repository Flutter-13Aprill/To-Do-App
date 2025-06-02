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

  static String _$userId(TaskModel v) => v.userId;
  static const Field<TaskModel, String> _f$userId = Field('userId', _$userId);
  static int? _$id(TaskModel v) => v.id;
  static const Field<TaskModel, int> _f$id = Field('id', _$id, opt: true);
  static String _$title(TaskModel v) => v.title;
  static const Field<TaskModel, String> _f$title = Field('title', _$title);
  static String _$description(TaskModel v) => v.description;
  static const Field<TaskModel, String> _f$description =
      Field('description', _$description);
  static DateTime _$dateTime(TaskModel v) => v.dateTime;
  static const Field<TaskModel, DateTime> _f$dateTime =
      Field('dateTime', _$dateTime);
  static int _$priority(TaskModel v) => v.priority;
  static const Field<TaskModel, int> _f$priority =
      Field('priority', _$priority);

  @override
  final MappableFields<TaskModel> fields = const {
    #userId: _f$userId,
    #id: _f$id,
    #title: _f$title,
    #description: _f$description,
    #dateTime: _f$dateTime,
    #priority: _f$priority,
  };

  static TaskModel _instantiate(DecodingData data) {
    return TaskModel(
        userId: data.dec(_f$userId),
        id: data.dec(_f$id),
        title: data.dec(_f$title),
        description: data.dec(_f$description),
        dateTime: data.dec(_f$dateTime),
        priority: data.dec(_f$priority));
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
      {String? userId,
      int? id,
      String? title,
      String? description,
      DateTime? dateTime,
      int? priority});
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
          {String? userId,
          Object? id = $none,
          String? title,
          String? description,
          DateTime? dateTime,
          int? priority}) =>
      $apply(FieldCopyWithData({
        if (userId != null) #userId: userId,
        if (id != $none) #id: id,
        if (title != null) #title: title,
        if (description != null) #description: description,
        if (dateTime != null) #dateTime: dateTime,
        if (priority != null) #priority: priority
      }));
  @override
  TaskModel $make(CopyWithData data) => TaskModel(
      userId: data.get(#userId, or: $value.userId),
      id: data.get(#id, or: $value.id),
      title: data.get(#title, or: $value.title),
      description: data.get(#description, or: $value.description),
      dateTime: data.get(#dateTime, or: $value.dateTime),
      priority: data.get(#priority, or: $value.priority));

  @override
  TaskModelCopyWith<$R2, TaskModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TaskModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
