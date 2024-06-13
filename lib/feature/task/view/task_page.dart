import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_board/app/ui_status.dart';
import 'package:task_board/feature/task/widgets/task_list_tile.dart';
import 'package:task_board/l10n/l10n.dart';
import 'package:task_board/feature/task/bloc/task_bloc.dart';
import 'package:task_board/feature/task/widgets/task_list_title.dart';
import 'package:task_board/injector/injector.dart';
import 'package:task_board/router/app_router.dart';
import 'package:go_router/go_router.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key, required this.isCompleted});

  final int isCompleted;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TaskBloc>(
      create: (context) =>
          Injector.instance<TaskBloc>()..add(const TaskEvent.loaded()),
      child: TaskListView(isCompleted),
    );
  }
}

class TaskListView extends StatelessWidget {
  const TaskListView(this.isCompleted, {super.key});

  final int isCompleted;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(isCompleted == 0 ? l10n.todoAppBar : isCompleted == 1 ? l10n.doingAppBar : l10n.doneAppBar),
        actions: const [
          // TodosOverviewFilterButton(),
          // TodosOverviewOptionsButton(),
        ],
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<TaskBloc, TaskState>(
            listenWhen: (previous, current) =>
                previous.status != current.status,
            listener: (context, state) {
              if (state.status == UILoadFailed) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Text(l10n.todosOverviewErrorSnackbarText),
                    ),
                  );
              }
            },
          ),
          BlocListener<TaskBloc, TaskState>(
            listenWhen: (previous, current) =>
                previous.lastDeletedTask != current.lastDeletedTask &&
                current.lastDeletedTask != null,
            listener: (context, state) {
              final deletedTodo = state.lastDeletedTask!;
              final messenger = ScaffoldMessenger.of(context);
              messenger
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text(
                      l10n.todosOverviewTodoDeletedSnackbarText(
                        deletedTodo.title ?? "",
                      ),
                    ),
                  ),
                );
            },
          ),
        ],
        child: BlocBuilder<TaskBloc, TaskState>(
          buildWhen: (prev, next) => prev.status != next.status,
          builder: (context, state) {
            return CupertinoScrollbar(
              child: ListView(
                children: [
                  for (final task in isCompleted == 0
                      ? state.tasks
                      : isCompleted == 1
                          ? state.inProgressTasks
                          : state.doneTasks)
                    TaskListTile(
                      task: task,
                      onToggleCompleted: (isCompleted) {
                        
                      },
                      onDismissed: (_) {
                        context
                            .read<TaskBloc>()
                            .add(TaskEvent.taskDeleted(task));
                      },
                      onTap: () {
                        context.go(AppRouter.editTaskPath, extra: task);
                      },
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
