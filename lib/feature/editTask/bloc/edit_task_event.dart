part of 'edit_task_bloc.dart';

@freezed
class EditTaskEvent with _$EditTaskEvent {
  const factory EditTaskEvent.onSubmitted() = _Submitted;
  const factory EditTaskEvent.onLoaded(String id) = _Loaded;
  factory EditTaskEvent.startTimeEntry(DateTime currentTime) = _StartTimeEntry;
  const factory EditTaskEvent.finishTimeEntry() = _FinishTimeEntry;
  const factory EditTaskEvent.editTaskLabel(String label) = _EditTaskLabel;
  const factory EditTaskEvent.editTaskDescription(String description) = _EditTaskDescription;
  const factory EditTaskEvent.editTaskTitle(String title) = _EditTaskTitle;
  const factory EditTaskEvent.editTaskDuration(int duration) = _EditTaskDuration;
}
