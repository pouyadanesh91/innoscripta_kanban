import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_board/app/ui_status.dart';
import 'package:task_board/data/models/task.dart';
import 'package:task_board/feature/editTask/bloc/edit_task_bloc.dart';
import 'package:task_board/feature/editTask/widgets/time_tracking_widget.dart';
import 'package:task_board/injector/injector.dart';
import 'package:task_board/l10n/l10n.dart';

class EditTaskPage extends StatelessWidget {
  final String? id;
  const EditTaskPage({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    final Task extraTask = GoRouterState.of(context).extra != null
        ? GoRouterState.of(context).extra as Task
        : const Task(title: "");
    return BlocProvider<EditTaskBloc>(
      create: (context) => Injector.instance<EditTaskBloc>()
        ..add(EditTaskEvent.onLoaded(extraTask.id ?? "")),
      child: const EditTaskView(),
    );
  }
}

class EditTaskView extends StatelessWidget {
  const EditTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final Task extraTask = GoRouterState.of(context).extra! as Task;
    final status = context.select((EditTaskBloc bloc) => bloc.state.status);
    final isNewTodo = extraTask.id == "" ? true : false;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            isNewTodo
                ? l10n.editTodoAddAppBarTitle
                : l10n.editTodoEditAppBarTitle,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: l10n.editTodoSaveButtonTooltip,
          shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
          ),
          onPressed: status == UILoading || status == UILoadSuccess
              ? null
              : () => context
                  .read<EditTaskBloc>()
                  .add(const EditTaskEvent.onSubmitted()),
          child: status == UILoading || status == UILoadSuccess
              ? const CupertinoActivityIndicator()
              : const Icon(Icons.check_rounded),
        ),
        body: MultiBlocListener(
          listeners: [
            BlocListener<EditTaskBloc, EditTaskState>(
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
          ],
          child: BlocBuilder<EditTaskBloc, EditTaskState>(
            buildWhen: (previous, current) => previous.status != current.status,
            builder: (context, state) {
              return  CupertinoScrollbar(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        state.isNewTask ? const SizedBox() : TimeTrackingWidget(),
                        const _DropDownField(),
                        const SizedBox(height: 15),
                        const _TitleField(),
                        const _DescriptionField()
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}

class _DropDownField extends StatelessWidget {
  const _DropDownField();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<EditTaskBloc>().state;
    final hintText = state.initialTask?.title ?? '';

    return DropdownButtonFormField<String>(
      value: state.taskStatusValue,
      items: const [
        DropdownMenuItem<String>(value: 'TODO',child: Text('To Do')),
        DropdownMenuItem<String>(value: 'INPROGRESS',child: Text('In Progress')),
        DropdownMenuItem<String>(value: 'DONE',child: Text('Done')),
      ],
      key: const Key('editTodoView_label_dropDownField'),
      decoration: InputDecoration(
        enabled: state.status != UILoading() || state.status != UILoadSuccess(),
        labelText: l10n.editTodoTitleLabel,
        prefixIcon: const Icon(Icons.select_all),
        hintText: hintText,
      ),
      onChanged: (value) {
        context.read<EditTaskBloc>().add(EditTaskEvent.editTaskLabel(value ?? ""));
      },
    );
  }
}

class _TitleField extends StatelessWidget {
  const _TitleField();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<EditTaskBloc>().state;
    final hintText = state.initialTask?.title ?? '';

    return TextFormField(
      key: const Key('editTodoView_title_textFormField'),
      initialValue: state.initialTask?.title,
      decoration: InputDecoration(
        enabled: state.status != UILoading || state.status != UILoadSuccess,
        labelText: l10n.editTodoTitleLabel,
        prefixIcon: const Icon(Icons.title),
        hintText: hintText,
      ),
      maxLength: 50,
      inputFormatters: [
        LengthLimitingTextInputFormatter(50),
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9\s]')),
      ],
      onChanged: (value) {
        context.read<EditTaskBloc>().add(EditTaskEvent.editTaskTitle(value));
      },
    );
  }
}

class _DescriptionField extends StatelessWidget {
  const _DescriptionField();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final state = context.watch<EditTaskBloc>().state;
    final hintText = state.initialTask?.description ?? '';

    return TextFormField(
      key: const Key('editTodoView_description_textFormField'),
      initialValue: state.description,
      decoration: InputDecoration(
        enabled: state.status != UILoading || state.status != UILoadSuccess,
        labelText: l10n.editTodoDescriptionLabel,
        hintText: hintText,
        prefixIcon: const Icon(Icons.description),
      ),
      maxLength: 300,
      maxLines: 7,
      inputFormatters: [
        LengthLimitingTextInputFormatter(300),
      ],
      onChanged: (value) {
        context.read<EditTaskBloc>().add(EditTaskEvent.editTaskDescription(value));
      },
    );
  }
}
