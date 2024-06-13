part of 'task_bloc.dart';

@Freezed()
class TaskState with _$TaskState {
  const factory TaskState({
    @Default(UIInitial()) UIStatus status,
    @Default([]) List<Task> tasks,
    @Default([]) List<Task> inProgressTasks,
    @Default([]) List<Task> doneTasks,
    Task? lastDeletedTask,
  }) = _TaskState;
}