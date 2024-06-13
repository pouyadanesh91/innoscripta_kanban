import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_board/app/ui_status.dart';
import 'package:task_board/data/models/task.dart';
import 'package:task_board/data/repositories/task_repository.dart';

part 'edit_task_event.dart';
part 'edit_task_state.dart';
part 'edit_task_bloc.freezed.dart';

class EditTaskBloc extends Bloc<EditTaskEvent, EditTaskState> {
  EditTaskBloc({required TaskRepository taskRepository})
      : super(const EditTaskState()) {
    _repository = taskRepository;
    on<_Submitted>(_onSubmitted);
    on<_Loaded>(_onLoaded);
    on<_StartTimeEntry>(_startTimeEntry);
    on<_FinishTimeEntry>(_finishTimeEntry);
    on<_EditTaskLabel>(_editTaskLabel);
    on<_EditTaskDescription>(_editTaskDescription);
    on<_EditTaskTitle>(_editTaskTitle);
  }

  late final TaskRepository _repository;

  void _editTaskLabel(
    _EditTaskLabel event,
    Emitter<EditTaskState> emit,
  ) {
    emit(state.copyWith(
        taskStatusValue: event.label,
        initialTask: state.initialTask != null
            ? state.initialTask?.copyWith(labels: [event.label])
            : Task(title: "", labels: [event.label])));
  }

  void _editTaskDescription(
    _EditTaskDescription event,
    Emitter<EditTaskState> emit,
  ) {
    emit(state.copyWith(
        description: event.description,
        initialTask: state.initialTask != null
            ? state.initialTask?.copyWith(description: event.description)
            : Task(title: "", description: event.description)));
  }

  void _editTaskTitle(
    _EditTaskTitle event,
    Emitter<EditTaskState> emit,
  ) {
    emit(state.copyWith(
        title: event.title,
        initialTask: state.initialTask != null
        ? state.initialTask?.copyWith(title: event.title)
        : Task(title: event.title)));
  }

  void _finishTimeEntry(
    _FinishTimeEntry event,
    Emitter<EditTaskState> emit,
  ) {
    int d = state.startDateTime != null
        ? DateTime.now().difference(state.startDateTime!).inMinutes
        : 0;
    emit(state.copyWith(
      isTicking: false,
      duration: d,
      // initialTask: state.initialTask?.copyWith(duration: d)
    ));
  }

  void _startTimeEntry(
    _StartTimeEntry event,
    Emitter<EditTaskState> emit,
  ) {
    emit(state.copyWith(isTicking: true, startDateTime: event.currentTime));
  }

  FutureOr<void> _onSubmitted(
    _Submitted event,
    Emitter<EditTaskState> emit,
  ) async {
    emit(state.copyWith(status: const UIStatus.loading()));
    if (state.isTicking) {
      int d = state.startDateTime != null
          ? DateTime.now().difference(state.startDateTime!).inMinutes
          : 0;
      emit(state.copyWith(
        isTicking: false,
        duration: d,
        // initialTask: state.initialTask?.copyWith(duration: d)
      ));
    }

    try {
      if (state.initialTask != null && state.initialTask?.id != null) {
        await _repository.editTask(state.initialTask?.id ?? "",
            state.initialTask ?? const Task(title: ""));
        emit(state.copyWith(status: const UIStatus.loadSuccess()));
      } else {
        await _repository
            .createTask(state.initialTask ?? const Task(title: ""));
        emit(state.copyWith(status: const UIStatus.loadSuccess()));
      }
    } catch (e) {
      emit(state.copyWith(status: UIStatus.loadFailed(message: e.toString())));
    }
  }

  FutureOr<void> _onLoaded(
    _Loaded event,
    Emitter<EditTaskState> emit,
  ) async {
    try {
      emit(
        state.copyWith(status: const UILoading(), id: event.id),
      );
      final Task task = await _repository.getTask(event.id);

      emit(
        state.copyWith(status: const UILoadSuccess(), initialTask: task),
      );
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      emit(
        state.copyWith(
          status: UILoadFailed(message: e.toString()),
        ),
      );
    }
  }
}
