// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'task_data_model.dart';

class TaskDataModelMapper extends ClassMapperBase<TaskDataModel> {
  TaskDataModelMapper._();

  static TaskDataModelMapper? _instance;
  static TaskDataModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TaskDataModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TaskDataModel';

  static String _$task(TaskDataModel v) => v.task;
  static const Field<TaskDataModel, String> _f$task = Field('task', _$task);
  static String _$description(TaskDataModel v) => v.description;
  static const Field<TaskDataModel, String> _f$description =
      Field('description', _$description);
  static String _$date(TaskDataModel v) => v.date;
  static const Field<TaskDataModel, String> _f$date = Field('date', _$date);
  static String _$time(TaskDataModel v) => v.time;
  static const Field<TaskDataModel, String> _f$time = Field('time', _$time);
  static String _$status(TaskDataModel v) => v.status;
  static const Field<TaskDataModel, String> _f$status =
      Field('status', _$status);
  static int _$taskCategory(TaskDataModel v) => v.taskCategory;
  static const Field<TaskDataModel, int> _f$taskCategory =
      Field('taskCategory', _$taskCategory);

  @override
  final MappableFields<TaskDataModel> fields = const {
    #task: _f$task,
    #description: _f$description,
    #date: _f$date,
    #time: _f$time,
    #status: _f$status,
    #taskCategory: _f$taskCategory,
  };

  static TaskDataModel _instantiate(DecodingData data) {
    return TaskDataModel(
        task: data.dec(_f$task),
        description: data.dec(_f$description),
        date: data.dec(_f$date),
        time: data.dec(_f$time),
        status: data.dec(_f$status),
        taskCategory: data.dec(_f$taskCategory));
  }

  @override
  final Function instantiate = _instantiate;

  static TaskDataModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TaskDataModel>(map);
  }

  static TaskDataModel fromJson(String json) {
    return ensureInitialized().decodeJson<TaskDataModel>(json);
  }
}

mixin TaskDataModelMappable {
  String toJson() {
    return TaskDataModelMapper.ensureInitialized()
        .encodeJson<TaskDataModel>(this as TaskDataModel);
  }

  Map<String, dynamic> toMap() {
    return TaskDataModelMapper.ensureInitialized()
        .encodeMap<TaskDataModel>(this as TaskDataModel);
  }

  TaskDataModelCopyWith<TaskDataModel, TaskDataModel, TaskDataModel>
      get copyWith => _TaskDataModelCopyWithImpl<TaskDataModel, TaskDataModel>(
          this as TaskDataModel, $identity, $identity);
  @override
  String toString() {
    return TaskDataModelMapper.ensureInitialized()
        .stringifyValue(this as TaskDataModel);
  }

  @override
  bool operator ==(Object other) {
    return TaskDataModelMapper.ensureInitialized()
        .equalsValue(this as TaskDataModel, other);
  }

  @override
  int get hashCode {
    return TaskDataModelMapper.ensureInitialized()
        .hashValue(this as TaskDataModel);
  }
}

extension TaskDataModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TaskDataModel, $Out> {
  TaskDataModelCopyWith<$R, TaskDataModel, $Out> get $asTaskDataModel =>
      $base.as((v, t, t2) => _TaskDataModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TaskDataModelCopyWith<$R, $In extends TaskDataModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? task,
      String? description,
      String? date,
      String? time,
      String? status,
      int? taskCategory});
  TaskDataModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TaskDataModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TaskDataModel, $Out>
    implements TaskDataModelCopyWith<$R, TaskDataModel, $Out> {
  _TaskDataModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TaskDataModel> $mapper =
      TaskDataModelMapper.ensureInitialized();
  @override
  $R call(
          {String? task,
          String? description,
          String? date,
          String? time,
          String? status,
          int? taskCategory}) =>
      $apply(FieldCopyWithData({
        if (task != null) #task: task,
        if (description != null) #description: description,
        if (date != null) #date: date,
        if (time != null) #time: time,
        if (status != null) #status: status,
        if (taskCategory != null) #taskCategory: taskCategory
      }));
  @override
  TaskDataModel $make(CopyWithData data) => TaskDataModel(
      task: data.get(#task, or: $value.task),
      description: data.get(#description, or: $value.description),
      date: data.get(#date, or: $value.date),
      time: data.get(#time, or: $value.time),
      status: data.get(#status, or: $value.status),
      taskCategory: data.get(#taskCategory, or: $value.taskCategory));

  @override
  TaskDataModelCopyWith<$R2, TaskDataModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TaskDataModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
