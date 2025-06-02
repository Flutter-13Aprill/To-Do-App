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

  static int _$id(TaskModel v) => v.id;
  static const Field<TaskModel, int> _f$id = Field('id', _$id);
  static String _$createdAt(TaskModel v) => v.createdAt;
  static const Field<TaskModel, String> _f$createdAt =
      Field('createdAt', _$createdAt, key: r'created_at');
  static String _$task(TaskModel v) => v.task;
  static const Field<TaskModel, String> _f$task = Field('task', _$task);
  static String _$desciption(TaskModel v) => v.desciption;
  static const Field<TaskModel, String> _f$desciption =
      Field('desciption', _$desciption);
  static String _$day(TaskModel v) => v.day;
  static const Field<TaskModel, String> _f$day = Field('day', _$day);
  static String _$month(TaskModel v) => v.month;
  static const Field<TaskModel, String> _f$month = Field('month', _$month);
  static String _$year(TaskModel v) => v.year;
  static const Field<TaskModel, String> _f$year = Field('year', _$year);
  static int _$priority(TaskModel v) => v.priority;
  static const Field<TaskModel, int> _f$priority =
      Field('priority', _$priority);
  static bool _$isDone(TaskModel v) => v.isDone;
  static const Field<TaskModel, bool> _f$isDone = Field('isDone', _$isDone);

  @override
  final MappableFields<TaskModel> fields = const {
    #id: _f$id,
    #createdAt: _f$createdAt,
    #task: _f$task,
    #desciption: _f$desciption,
    #day: _f$day,
    #month: _f$month,
    #year: _f$year,
    #priority: _f$priority,
    #isDone: _f$isDone,
  };

  static TaskModel _instantiate(DecodingData data) {
    return TaskModel(
        id: data.dec(_f$id),
        createdAt: data.dec(_f$createdAt),
        task: data.dec(_f$task),
        desciption: data.dec(_f$desciption),
        day: data.dec(_f$day),
        month: data.dec(_f$month),
        year: data.dec(_f$year),
        priority: data.dec(_f$priority),
        isDone: data.dec(_f$isDone));
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
      {int? id,
      String? createdAt,
      String? task,
      String? desciption,
      String? day,
      String? month,
      String? year,
      int? priority,
      bool? isDone});
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
          {int? id,
          String? createdAt,
          String? task,
          String? desciption,
          String? day,
          String? month,
          String? year,
          int? priority,
          bool? isDone}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (createdAt != null) #createdAt: createdAt,
        if (task != null) #task: task,
        if (desciption != null) #desciption: desciption,
        if (day != null) #day: day,
        if (month != null) #month: month,
        if (year != null) #year: year,
        if (priority != null) #priority: priority,
        if (isDone != null) #isDone: isDone
      }));
  @override
  TaskModel $make(CopyWithData data) => TaskModel(
      id: data.get(#id, or: $value.id),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      task: data.get(#task, or: $value.task),
      desciption: data.get(#desciption, or: $value.desciption),
      day: data.get(#day, or: $value.day),
      month: data.get(#month, or: $value.month),
      year: data.get(#year, or: $value.year),
      priority: data.get(#priority, or: $value.priority),
      isDone: data.get(#isDone, or: $value.isDone));

  @override
  TaskModelCopyWith<$R2, TaskModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TaskModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
