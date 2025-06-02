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

  static int? _$id(TaskModel v) => v.id;
  static const Field<TaskModel, int> _f$id = Field('id', _$id, opt: true);
  static String _$title(TaskModel v) => v.title;
  static const Field<TaskModel, String> _f$title = Field('title', _$title);
  static String? _$description(TaskModel v) => v.description;
  static const Field<TaskModel, String> _f$description =
      Field('description', _$description, opt: true);
  static String? _$category(TaskModel v) => v.category;
  static const Field<TaskModel, String> _f$category =
      Field('category', _$category, opt: true);
  static int? _$priority(TaskModel v) => v.priority;
  static const Field<TaskModel, int> _f$priority =
      Field('priority', _$priority, opt: true);
  static DateTime? _$taskTime(TaskModel v) => v.taskTime;
  static const Field<TaskModel, DateTime> _f$taskTime =
      Field('taskTime', _$taskTime, key: r'task_time', opt: true);
  static bool _$isCompleted(TaskModel v) => v.isCompleted;
  static const Field<TaskModel, bool> _f$isCompleted = Field(
      'isCompleted', _$isCompleted,
      key: r'is_completed', opt: true, def: false);
  static DateTime? _$createdAt(TaskModel v) => v.createdAt;
  static const Field<TaskModel, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt, key: r'created_at', opt: true);
  static DateTime? _$updatedAt(TaskModel v) => v.updatedAt;
  static const Field<TaskModel, DateTime> _f$updatedAt =
      Field('updatedAt', _$updatedAt, key: r'updated_at', opt: true);

  @override
  final MappableFields<TaskModel> fields = const {
    #id: _f$id,
    #title: _f$title,
    #description: _f$description,
    #category: _f$category,
    #priority: _f$priority,
    #taskTime: _f$taskTime,
    #isCompleted: _f$isCompleted,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
  };

  static TaskModel _instantiate(DecodingData data) {
    return TaskModel(
        id: data.dec(_f$id),
        title: data.dec(_f$title),
        description: data.dec(_f$description),
        category: data.dec(_f$category),
        priority: data.dec(_f$priority),
        taskTime: data.dec(_f$taskTime),
        isCompleted: data.dec(_f$isCompleted),
        createdAt: data.dec(_f$createdAt),
        updatedAt: data.dec(_f$updatedAt));
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
      String? title,
      String? description,
      String? category,
      int? priority,
      DateTime? taskTime,
      bool? isCompleted,
      DateTime? createdAt,
      DateTime? updatedAt});
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
          {Object? id = $none,
          String? title,
          Object? description = $none,
          Object? category = $none,
          Object? priority = $none,
          Object? taskTime = $none,
          bool? isCompleted,
          Object? createdAt = $none,
          Object? updatedAt = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (title != null) #title: title,
        if (description != $none) #description: description,
        if (category != $none) #category: category,
        if (priority != $none) #priority: priority,
        if (taskTime != $none) #taskTime: taskTime,
        if (isCompleted != null) #isCompleted: isCompleted,
        if (createdAt != $none) #createdAt: createdAt,
        if (updatedAt != $none) #updatedAt: updatedAt
      }));
  @override
  TaskModel $make(CopyWithData data) => TaskModel(
      id: data.get(#id, or: $value.id),
      title: data.get(#title, or: $value.title),
      description: data.get(#description, or: $value.description),
      category: data.get(#category, or: $value.category),
      priority: data.get(#priority, or: $value.priority),
      taskTime: data.get(#taskTime, or: $value.taskTime),
      isCompleted: data.get(#isCompleted, or: $value.isCompleted),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      updatedAt: data.get(#updatedAt, or: $value.updatedAt));

  @override
  TaskModelCopyWith<$R2, TaskModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TaskModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
