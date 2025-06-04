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

  static String? _$userName(TaskModel v) => v.userName;
  static const Field<TaskModel, String> _f$userName =
      Field('userName', _$userName, key: r'user_name', opt: true);
  static String _$taskName(TaskModel v) => v.taskName;
  static const Field<TaskModel, String> _f$taskName =
      Field('taskName', _$taskName, key: r'task_name');
  static String _$categoryName(TaskModel v) => v.categoryName;
  static const Field<TaskModel, String> _f$categoryName =
      Field('categoryName', _$categoryName, key: r'category_name');
  static DateTime _$deadLine(TaskModel v) => v.deadLine;
  static const Field<TaskModel, DateTime> _f$deadLine =
      Field('deadLine', _$deadLine, key: r'dead_line');
  static String _$priorityTask(TaskModel v) => v.priorityTask;
  static const Field<TaskModel, String> _f$priorityTask =
      Field('priorityTask', _$priorityTask, key: r'priority_task');
  static bool _$isCompleted(TaskModel v) => v.isCompleted;
  static const Field<TaskModel, bool> _f$isCompleted =
      Field('isCompleted', _$isCompleted, key: r'is_completed');
  static String _$id(TaskModel v) => v.id;
  static const Field<TaskModel, String> _f$id =
      Field('id', _$id, mode: FieldMode.member);

  @override
  final MappableFields<TaskModel> fields = const {
    #userName: _f$userName,
    #taskName: _f$taskName,
    #categoryName: _f$categoryName,
    #deadLine: _f$deadLine,
    #priorityTask: _f$priorityTask,
    #isCompleted: _f$isCompleted,
    #id: _f$id,
  };

  static TaskModel _instantiate(DecodingData data) {
    return TaskModel(
        userName: data.dec(_f$userName),
        taskName: data.dec(_f$taskName),
        categoryName: data.dec(_f$categoryName),
        deadLine: data.dec(_f$deadLine),
        priorityTask: data.dec(_f$priorityTask),
        isCompleted: data.dec(_f$isCompleted));
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
      {String? userName,
      String? taskName,
      String? categoryName,
      DateTime? deadLine,
      String? priorityTask,
      bool? isCompleted});
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
          {Object? userName = $none,
          String? taskName,
          String? categoryName,
          DateTime? deadLine,
          String? priorityTask,
          bool? isCompleted}) =>
      $apply(FieldCopyWithData({
        if (userName != $none) #userName: userName,
        if (taskName != null) #taskName: taskName,
        if (categoryName != null) #categoryName: categoryName,
        if (deadLine != null) #deadLine: deadLine,
        if (priorityTask != null) #priorityTask: priorityTask,
        if (isCompleted != null) #isCompleted: isCompleted
      }));
  @override
  TaskModel $make(CopyWithData data) => TaskModel(
      userName: data.get(#userName, or: $value.userName),
      taskName: data.get(#taskName, or: $value.taskName),
      categoryName: data.get(#categoryName, or: $value.categoryName),
      deadLine: data.get(#deadLine, or: $value.deadLine),
      priorityTask: data.get(#priorityTask, or: $value.priorityTask),
      isCompleted: data.get(#isCompleted, or: $value.isCompleted));

  @override
  TaskModelCopyWith<$R2, TaskModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TaskModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
