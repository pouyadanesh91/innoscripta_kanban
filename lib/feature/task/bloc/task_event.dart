part of 'task_bloc.dart';

@Freezed()
class TaskEvent with _$TaskEvent {
  const factory TaskEvent.loaded() = _Loaded;
  const factory TaskEvent.taskDeleted(Task task) = _Deleted;
}
