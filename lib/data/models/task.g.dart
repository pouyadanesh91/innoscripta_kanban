// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      title: json['content'] as String?,
      id: json['id'] as String?,
      commentCount: (json['comment_count'] as num?)?.toInt(),
      description: json['description'] as String?,
      isCompleted: json['is_completed'] as bool?,
      labels:
          (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList(),
      dueDateTime: json['due_datetime'] as String?,
      createdAt: json['created_at'] as String?,
      duration: (json['duration'] as num?)?.toInt(),
      durationUnit: json['duration_unit'] as String?,
      type: json['type'] as String? ?? "TASK",
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'content': instance.title,
      'id': instance.id,
      'comment_count': instance.commentCount,
      'description': instance.description,
      'is_completed': instance.isCompleted,
      'labels': instance.labels,
      'due_datetime': instance.dueDateTime,
      'created_at': instance.createdAt,
      'duration': instance.duration,
      'duration_unit': instance.durationUnit,
      'type': instance.type,
    };
