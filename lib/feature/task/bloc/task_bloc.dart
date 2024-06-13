import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_board/app/ui_status.dart';
import 'package:task_board/data/models/task.dart';
import 'package:task_board/data/repositories/task_repository.dart';

part 'task_event.dart';
part 'task_state.dart';
part 'task_bloc.freezed.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc({required TaskRepository taskRepository})
      : super(const TaskState()) {
    _repository = taskRepository;
    on<_Loaded>(_onLoaded);
    on<_Deleted>(_onDeleted);
  }

  late final TaskRepository _repository;

  FutureOr<void> _onDeleted(
    _Deleted event,
    Emitter<TaskState> emit,
  ) async {
    try {
      if (state.status != const UILoading()) {
        emit(
          state.copyWith(
            status: const UILoading(),
          ),
        );
        await _repository.deleteTask(event.task.id ?? "");
       final List<Task> tasks = await _repository.getTasks();
        List<Task> todos = [];
        List<Task> doings = [];
        List<Task> dones = [];
        for (var ta in tasks) {
          if (ta.labels == null) {
            todos.add(ta);
          }
          // ignore: prefer_is_empty
          if(ta.labels?.length == 0) {
            todos.add(ta);
          } else {
          if (ta.labels?[0] == "TODO") {
              todos.add(ta);
            }
            if (ta.labels?[0] == "INPROGRESS") {
              doings.add(ta);
            }
            if (ta.labels?[0] == "DONE") {
              dones.add(ta);
            }

          }
        }
        emit(
          state.copyWith(status: const UILoadSuccess(), tasks: todos, inProgressTasks: doings, doneTasks: dones),
        );
      }
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      emit(
        state.copyWith(
          status: UILoadFailed(message: e.toString()),
        ),
      );
    }
  }

  FutureOr<void> _onLoaded(
    _Loaded event,
    Emitter<TaskState> emit,
  ) async {
    try {
      if (state.status != const UILoading()) {
        emit(
          state.copyWith(
            status: const UILoading(),
          ),
        );
        final List<Task> tasks = await _repository.getTasks();
        List<Task> todos = [];
        List<Task> doings = [];
        List<Task> dones = [];
        for (var ta in tasks) {
          if (ta.labels == null) {
            todos.add(ta);
          }
          // ignore: prefer_is_empty
          if(ta.labels?.length == 0) {
            todos.add(ta);
          } else {
          if (ta.labels?[0] == "TODO") {
              todos.add(ta);
            }
            if (ta.labels?[0] == "INPROGRESS") {
              doings.add(ta);
            }
            if (ta.labels?[0] == "DONE") {
              dones.add(ta);
            }

          }
        }
        emit(
          state.copyWith(status: const UILoadSuccess(), tasks: todos, inProgressTasks: doings, doneTasks: dones),
        );
       
      }
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
