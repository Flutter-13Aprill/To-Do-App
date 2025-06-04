// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'todo_model.dart';

class ToDoModelMapper extends ClassMapperBase<ToDoModel> {
  ToDoModelMapper._();

  static ToDoModelMapper? _instance;
  static ToDoModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ToDoModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ToDoModel';

  static String? _$id(ToDoModel v) => v.id;
  static const Field<ToDoModel, String> _f$id = Field('id', _$id, opt: true);
  static String _$userId(ToDoModel v) => v.userId;
  static const Field<ToDoModel, String> _f$userId =
      Field('userId', _$userId, key: r'user_id');
  static String _$task(ToDoModel v) => v.task;
  static const Field<ToDoModel, String> _f$task = Field('task', _$task);
  static String _$description(ToDoModel v) => v.description;
  static const Field<ToDoModel, String> _f$description =
      Field('description', _$description);
  static String _$dueDate(ToDoModel v) => v.dueDate;
  static const Field<ToDoModel, String> _f$dueDate =
      Field('dueDate', _$dueDate, key: r'due_date');
  static bool _$isDone(ToDoModel v) => v.isDone;
  static const Field<ToDoModel, bool> _f$isDone =
      Field('isDone', _$isDone, key: r'is_done');
  static String? _$category(ToDoModel v) => v.category;
  static const Field<ToDoModel, String> _f$category =
      Field('category', _$category);
  static int? _$priority(ToDoModel v) => v.priority;
  static const Field<ToDoModel, int> _f$priority =
      Field('priority', _$priority);

  @override
  final MappableFields<ToDoModel> fields = const {
    #id: _f$id,
    #userId: _f$userId,
    #task: _f$task,
    #description: _f$description,
    #dueDate: _f$dueDate,
    #isDone: _f$isDone,
    #category: _f$category,
    #priority: _f$priority,
  };

  static ToDoModel _instantiate(DecodingData data) {
    return ToDoModel(
        id: data.dec(_f$id),
        userId: data.dec(_f$userId),
        task: data.dec(_f$task),
        description: data.dec(_f$description),
        dueDate: data.dec(_f$dueDate),
        isDone: data.dec(_f$isDone),
        category: data.dec(_f$category),
        priority: data.dec(_f$priority));
  }

  @override
  final Function instantiate = _instantiate;

  static ToDoModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ToDoModel>(map);
  }

  static ToDoModel fromJson(String json) {
    return ensureInitialized().decodeJson<ToDoModel>(json);
  }
}

mixin ToDoModelMappable {
  String toJson() {
    return ToDoModelMapper.ensureInitialized()
        .encodeJson<ToDoModel>(this as ToDoModel);
  }

  Map<String, dynamic> toMap() {
    return ToDoModelMapper.ensureInitialized()
        .encodeMap<ToDoModel>(this as ToDoModel);
  }

  ToDoModelCopyWith<ToDoModel, ToDoModel, ToDoModel> get copyWith =>
      _ToDoModelCopyWithImpl<ToDoModel, ToDoModel>(
          this as ToDoModel, $identity, $identity);
  @override
  String toString() {
    return ToDoModelMapper.ensureInitialized()
        .stringifyValue(this as ToDoModel);
  }

  @override
  bool operator ==(Object other) {
    return ToDoModelMapper.ensureInitialized()
        .equalsValue(this as ToDoModel, other);
  }

  @override
  int get hashCode {
    return ToDoModelMapper.ensureInitialized().hashValue(this as ToDoModel);
  }
}

extension ToDoModelValueCopy<$R, $Out> on ObjectCopyWith<$R, ToDoModel, $Out> {
  ToDoModelCopyWith<$R, ToDoModel, $Out> get $asToDoModel =>
      $base.as((v, t, t2) => _ToDoModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ToDoModelCopyWith<$R, $In extends ToDoModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? id,
      String? userId,
      String? task,
      String? description,
      String? dueDate,
      bool? isDone,
      String? category,
      int? priority});
  ToDoModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ToDoModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ToDoModel, $Out>
    implements ToDoModelCopyWith<$R, ToDoModel, $Out> {
  _ToDoModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ToDoModel> $mapper =
      ToDoModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          String? userId,
          String? task,
          String? description,
          String? dueDate,
          bool? isDone,
          Object? category = $none,
          Object? priority = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (userId != null) #userId: userId,
        if (task != null) #task: task,
        if (description != null) #description: description,
        if (dueDate != null) #dueDate: dueDate,
        if (isDone != null) #isDone: isDone,
        if (category != $none) #category: category,
        if (priority != $none) #priority: priority
      }));
  @override
  ToDoModel $make(CopyWithData data) => ToDoModel(
      id: data.get(#id, or: $value.id),
      userId: data.get(#userId, or: $value.userId),
      task: data.get(#task, or: $value.task),
      description: data.get(#description, or: $value.description),
      dueDate: data.get(#dueDate, or: $value.dueDate),
      isDone: data.get(#isDone, or: $value.isDone),
      category: data.get(#category, or: $value.category),
      priority: data.get(#priority, or: $value.priority));

  @override
  ToDoModelCopyWith<$R2, ToDoModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ToDoModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
