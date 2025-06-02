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
  static int? _$categoryId(TaskModel v) => v.categoryId;
  static const Field<TaskModel, int> _f$categoryId =
      Field('categoryId', _$categoryId, key: r'category_id', opt: true);
  static int _$priority(TaskModel v) => v.priority;
  static const Field<TaskModel, int> _f$priority =
      Field('priority', _$priority);
  static DateTime _$datetime(TaskModel v) => v.datetime;
  static const Field<TaskModel, DateTime> _f$datetime =
      Field('datetime', _$datetime);
  static String? _$createdAt(TaskModel v) => v.createdAt;
  static const Field<TaskModel, String> _f$createdAt =
      Field('createdAt', _$createdAt, key: r'created_at', opt: true);
  static String _$userId(TaskModel v) => v.userId;
  static const Field<TaskModel, String> _f$userId =
      Field('userId', _$userId, key: r'user_id');
  static bool _$isCompleted(TaskModel v) => v.isCompleted;
  static const Field<TaskModel, bool> _f$isCompleted =
      Field('isCompleted', _$isCompleted, key: r'is_completed');
  static bool _$isDeleted(TaskModel v) => v.isDeleted;
  static const Field<TaskModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, key: r'is_deleted');

  @override
  final MappableFields<TaskModel> fields = const {
    #id: _f$id,
    #title: _f$title,
    #description: _f$description,
    #categoryId: _f$categoryId,
    #priority: _f$priority,
    #datetime: _f$datetime,
    #createdAt: _f$createdAt,
    #userId: _f$userId,
    #isCompleted: _f$isCompleted,
    #isDeleted: _f$isDeleted,
  };

  static TaskModel _instantiate(DecodingData data) {
    return TaskModel(
        id: data.dec(_f$id),
        title: data.dec(_f$title),
        description: data.dec(_f$description),
        categoryId: data.dec(_f$categoryId),
        priority: data.dec(_f$priority),
        datetime: data.dec(_f$datetime),
        createdAt: data.dec(_f$createdAt),
        userId: data.dec(_f$userId),
        isCompleted: data.dec(_f$isCompleted),
        isDeleted: data.dec(_f$isDeleted));
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
      int? categoryId,
      int? priority,
      DateTime? datetime,
      String? createdAt,
      String? userId,
      bool? isCompleted,
      bool? isDeleted});
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
          Object? categoryId = $none,
          int? priority,
          DateTime? datetime,
          Object? createdAt = $none,
          String? userId,
          bool? isCompleted,
          bool? isDeleted}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (title != null) #title: title,
        if (description != $none) #description: description,
        if (categoryId != $none) #categoryId: categoryId,
        if (priority != null) #priority: priority,
        if (datetime != null) #datetime: datetime,
        if (createdAt != $none) #createdAt: createdAt,
        if (userId != null) #userId: userId,
        if (isCompleted != null) #isCompleted: isCompleted,
        if (isDeleted != null) #isDeleted: isDeleted
      }));
  @override
  TaskModel $make(CopyWithData data) => TaskModel(
      id: data.get(#id, or: $value.id),
      title: data.get(#title, or: $value.title),
      description: data.get(#description, or: $value.description),
      categoryId: data.get(#categoryId, or: $value.categoryId),
      priority: data.get(#priority, or: $value.priority),
      datetime: data.get(#datetime, or: $value.datetime),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      userId: data.get(#userId, or: $value.userId),
      isCompleted: data.get(#isCompleted, or: $value.isCompleted),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  TaskModelCopyWith<$R2, TaskModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TaskModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
