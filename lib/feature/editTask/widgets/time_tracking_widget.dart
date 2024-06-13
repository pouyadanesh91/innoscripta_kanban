import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_board/app/ui_status.dart';
import 'package:task_board/feature/editTask/bloc/edit_task_bloc.dart';
import 'package:task_board/feature/widgets/seconds_builder.dart';
import 'package:task_board/l10n/l10n.dart';

class TimeTrackingWidget extends StatefulWidget {
  @override
  State<TimeTrackingWidget> createState() => _TimeTrackingWidgetState();
}

class _TimeTrackingWidgetState extends State<TimeTrackingWidget> {
  bool timerGoing = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    return BlocBuilder<EditTaskBloc, EditTaskState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              l10n.timeTracking,
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 2,
                  child: CupertinoButton(
                    child: AnimatedSwitcher(
                      duration: const Duration(seconds: 1),
                      child: state.status == UILoading
                          ? CupertinoActivityIndicator(
                              color: theme.iconTheme.color,
                            )
                          : state.isTicking
                              ? const Icon(CupertinoIcons.pause_circle_fill,
                                  size: 48)
                              : const Icon(CupertinoIcons.play_circle_fill,
                                  size: 48),
                    ),
                    onPressed: () {
                      if (state.isTicking) {
                        setState(() {
                          timerGoing = false;
                        });
                        return context
                            .read<EditTaskBloc>()
                            .add(const EditTaskEvent.finishTimeEntry());
                      }
                      setState(() {
                        timerGoing = true;
                      });
                      return context
                          .read<EditTaskBloc>()
                          .add(EditTaskEvent.startTimeEntry(DateTime.now()));
                    },
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: AnimatedSwitcher(
                    duration: const Duration(seconds: 1),
                    child: SecondsBuilder(
                      shouldPlay: timerGoing,
                      initTimeInSeconds: state.startDateTime ?? DateTime.now(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
          ],
        );
      },
    );
  }
}
