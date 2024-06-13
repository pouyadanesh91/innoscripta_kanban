part of 'edit_task_bloc.dart';

@freezed
class EditTaskState with _$EditTaskState {
  const EditTaskState._();
  const factory EditTaskState({
    @Default(UIInitial()) UIStatus status,
    @Default("") String id,
    @Default("") String title,
    @Default("") String description,
    @Default("TODO") String taskStatusValue,
    @Default(false) bool isTicking,
    @Default(0) int duration,
    DateTime? startDateTime,
    Task? initialTask,
  }) = _EditTaskState;

  bool get isNewTask {
    return initialTask == null;
  }
  List<Object?> get props => [status, initialTask, id, title, description, isTicking, taskStatusValue];

  
}
