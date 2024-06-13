// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
mixin _$Task {
  @JsonKey(name: 'content')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'comment_count')
  int? get commentCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_completed')
  bool? get isCompleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'labels')
  List<String>? get labels => throw _privateConstructorUsedError;
  @JsonKey(name: 'due_datetime')
  String? get dueDateTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration')
  int? get duration => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration_unit')
  String? get durationUnit => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call(
      {@JsonKey(name: 'content') String? title,
      @JsonKey(name: 'id') String? id,
      @JsonKey(name: 'comment_count') int? commentCount,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'is_completed') bool? isCompleted,
      @JsonKey(name: 'labels') List<String>? labels,
      @JsonKey(name: 'due_datetime') String? dueDateTime,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'duration') int? duration,
      @JsonKey(name: 'duration_unit') String? durationUnit,
      String type});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? id = freezed,
    Object? commentCount = freezed,
    Object? description = freezed,
    Object? isCompleted = freezed,
    Object? labels = freezed,
    Object? dueDateTime = freezed,
    Object? createdAt = freezed,
    Object? duration = freezed,
    Object? durationUnit = freezed,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      commentCount: freezed == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: freezed == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      labels: freezed == labels
          ? _value.labels
          : labels // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      dueDateTime: freezed == dueDateTime
          ? _value.dueDateTime
          : dueDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      durationUnit: freezed == durationUnit
          ? _value.durationUnit
          : durationUnit // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskImplCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$TaskImplCopyWith(
          _$TaskImpl value, $Res Function(_$TaskImpl) then) =
      __$$TaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'content') String? title,
      @JsonKey(name: 'id') String? id,
      @JsonKey(name: 'comment_count') int? commentCount,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'is_completed') bool? isCompleted,
      @JsonKey(name: 'labels') List<String>? labels,
      @JsonKey(name: 'due_datetime') String? dueDateTime,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'duration') int? duration,
      @JsonKey(name: 'duration_unit') String? durationUnit,
      String type});
}

/// @nodoc
class __$$TaskImplCopyWithImpl<$Res>
    extends _$TaskCopyWithImpl<$Res, _$TaskImpl>
    implements _$$TaskImplCopyWith<$Res> {
  __$$TaskImplCopyWithImpl(_$TaskImpl _value, $Res Function(_$TaskImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? id = freezed,
    Object? commentCount = freezed,
    Object? description = freezed,
    Object? isCompleted = freezed,
    Object? labels = freezed,
    Object? dueDateTime = freezed,
    Object? createdAt = freezed,
    Object? duration = freezed,
    Object? durationUnit = freezed,
    Object? type = null,
  }) {
    return _then(_$TaskImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      commentCount: freezed == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: freezed == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      labels: freezed == labels
          ? _value._labels
          : labels // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      dueDateTime: freezed == dueDateTime
          ? _value.dueDateTime
          : dueDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      durationUnit: freezed == durationUnit
          ? _value.durationUnit
          : durationUnit // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$TaskImpl implements _Task {
  const _$TaskImpl(
      {@JsonKey(name: 'content') this.title,
      @JsonKey(name: 'id') this.id,
      @JsonKey(name: 'comment_count') this.commentCount,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'is_completed') this.isCompleted,
      @JsonKey(name: 'labels') final List<String>? labels,
      @JsonKey(name: 'due_datetime') this.dueDateTime,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'duration') this.duration,
      @JsonKey(name: 'duration_unit') this.durationUnit,
      this.type = "TASK"})
      : _labels = labels;

  factory _$TaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskImplFromJson(json);

  @override
  @JsonKey(name: 'content')
  final String? title;
  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'comment_count')
  final int? commentCount;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'is_completed')
  final bool? isCompleted;
  final List<String>? _labels;
  @override
  @JsonKey(name: 'labels')
  List<String>? get labels {
    final value = _labels;
    if (value == null) return null;
    if (_labels is EqualUnmodifiableListView) return _labels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'due_datetime')
  final String? dueDateTime;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'duration')
  final int? duration;
  @override
  @JsonKey(name: 'duration_unit')
  final String? durationUnit;
  @override
  @JsonKey()
  final String type;

  @override
  String toString() {
    return 'Task(title: $title, id: $id, commentCount: $commentCount, description: $description, isCompleted: $isCompleted, labels: $labels, dueDateTime: $dueDateTime, createdAt: $createdAt, duration: $duration, durationUnit: $durationUnit, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.commentCount, commentCount) ||
                other.commentCount == commentCount) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            const DeepCollectionEquality().equals(other._labels, _labels) &&
            (identical(other.dueDateTime, dueDateTime) ||
                other.dueDateTime == dueDateTime) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.durationUnit, durationUnit) ||
                other.durationUnit == durationUnit) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      id,
      commentCount,
      description,
      isCompleted,
      const DeepCollectionEquality().hash(_labels),
      dueDateTime,
      createdAt,
      duration,
      durationUnit,
      type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      __$$TaskImplCopyWithImpl<_$TaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskImplToJson(
      this,
    );
  }
}

abstract class _Task implements Task {
  const factory _Task(
      {@JsonKey(name: 'content') final String? title,
      @JsonKey(name: 'id') final String? id,
      @JsonKey(name: 'comment_count') final int? commentCount,
      @JsonKey(name: 'description') final String? description,
      @JsonKey(name: 'is_completed') final bool? isCompleted,
      @JsonKey(name: 'labels') final List<String>? labels,
      @JsonKey(name: 'due_datetime') final String? dueDateTime,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'duration') final int? duration,
      @JsonKey(name: 'duration_unit') final String? durationUnit,
      final String type}) = _$TaskImpl;

  factory _Task.fromJson(Map<String, dynamic> json) = _$TaskImpl.fromJson;

  @override
  @JsonKey(name: 'content')
  String? get title;
  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'comment_count')
  int? get commentCount;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'is_completed')
  bool? get isCompleted;
  @override
  @JsonKey(name: 'labels')
  List<String>? get labels;
  @override
  @JsonKey(name: 'due_datetime')
  String? get dueDateTime;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'duration')
  int? get duration;
  @override
  @JsonKey(name: 'duration_unit')
  String? get durationUnit;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
