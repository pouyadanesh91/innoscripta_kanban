// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory Task({
    @JsonKey(name: 'content') String? title,
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'comment_count') int? commentCount,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'is_completed') bool? isCompleted,
    @JsonKey(name: 'labels') List<String>? labels,
    @JsonKey(name: 'due_datetime') String? dueDateTime,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'duration') int? duration,
    @JsonKey(name: 'duration_unit') String? durationUnit,
    @Default("TASK") String type,
  })  = _Task;

  factory Task.fromJson(Map<String, dynamic> json) =>
      _$TaskFromJson(json);
}