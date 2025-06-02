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
  static bool? _$isComplete(TaskModel v) => v.isComplete;
  static const Field<TaskModel, bool> _f$isComplete =
      Field('isComplete', _$isComplete, key: r'iscomplete', opt: true);
  static String _$task(TaskModel v) => v.task;
  static const Field<TaskModel, String> _f$task = Field('task', _$task);
  static String _$catagory(TaskModel v) => v.catagory;
  static const Field<TaskModel, String> _f$catagory =
      Field('catagory', _$catagory);
  static int? _$catagoryColor(TaskModel v) => v.catagoryColor;
  static const Field<TaskModel, int> _f$catagoryColor = Field(
      'catagoryColor', _$catagoryColor,
      key: r'catagory_color', opt: true);
  static int _$priorty(TaskModel v) => v.priorty;
  static const Field<TaskModel, int> _f$priorty = Field('priorty', _$priorty);
  static String _$date(TaskModel v) => v.date;
  static const Field<TaskModel, String> _f$date = Field('date', _$date);
  static TimeOfDay? _$time(TaskModel v) => v.time;
  static const Field<TaskModel, TimeOfDay> _f$time =
      Field('time', _$time, opt: true);

  @override
  final MappableFields<TaskModel> fields = const {
    #id: _f$id,
    #isComplete: _f$isComplete,
    #task: _f$task,
    #catagory: _f$catagory,
    #catagoryColor: _f$catagoryColor,
    #priorty: _f$priorty,
    #date: _f$date,
    #time: _f$time,
  };

  static TaskModel _instantiate(DecodingData data) {
    return TaskModel(
        id: data.dec(_f$id),
        isComplete: data.dec(_f$isComplete),
        task: data.dec(_f$task),
        catagory: data.dec(_f$catagory),
        catagoryColor: data.dec(_f$catagoryColor),
        priorty: data.dec(_f$priorty),
        date: data.dec(_f$date),
        time: data.dec(_f$time));
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
      bool? isComplete,
      String? task,
      String? catagory,
      int? catagoryColor,
      int? priorty,
      String? date,
      TimeOfDay? time});
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
          Object? isComplete = $none,
          String? task,
          String? catagory,
          Object? catagoryColor = $none,
          int? priorty,
          String? date,
          Object? time = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (isComplete != $none) #isComplete: isComplete,
        if (task != null) #task: task,
        if (catagory != null) #catagory: catagory,
        if (catagoryColor != $none) #catagoryColor: catagoryColor,
        if (priorty != null) #priorty: priorty,
        if (date != null) #date: date,
        if (time != $none) #time: time
      }));
  @override
  TaskModel $make(CopyWithData data) => TaskModel(
      id: data.get(#id, or: $value.id),
      isComplete: data.get(#isComplete, or: $value.isComplete),
      task: data.get(#task, or: $value.task),
      catagory: data.get(#catagory, or: $value.catagory),
      catagoryColor: data.get(#catagoryColor, or: $value.catagoryColor),
      priorty: data.get(#priorty, or: $value.priorty),
      date: data.get(#date, or: $value.date),
      time: data.get(#time, or: $value.time));

  @override
  TaskModelCopyWith<$R2, TaskModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TaskModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
