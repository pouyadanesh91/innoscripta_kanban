import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_board/core/utils.dart';
import 'package:task_board/data/models/task.dart';
import 'package:task_board/l10n/l10n.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({
    required this.task,
    super.key,
    this.onToggleCompleted,
    this.onDismissed,
    this.onTap,
  });

  final Task task;
  final ValueChanged<bool>? onToggleCompleted;
  final ValueChanged<String>? onDismissed;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    Size size = MediaQuery.of(context).size;
    final DateTime createdDate = DateTime.parse(task.createdAt ?? "");
    final String createdDateFormatted =
        DateFormat("d MMM yyyy").format(createdDate);
    final DateTime updatedDate = DateTime.parse(task.createdAt ?? "");
    final String updatedDateFormatted =
        DateFormat("d MMM yyyy").format(updatedDate);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      task.title ?? '',
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const Spacer(),
                  Visibility(
                    visible: task.labels == null || task.labels?.length == 0 || task.labels?[0] != "DONE",
                    child: IconButton(
                        onPressed: () {
                          onToggleCompleted!(true);
                        },
                        icon: const Icon(
                          Icons.check_circle,
                          color: Color.fromARGB(255, 189, 188, 188),
                        )),
                  ),
                  IconButton(
                    onPressed: () {
                      onDismissed!(task.id ?? "");
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_month,
                    size: 13,
                    color: Colors.grey,
                  ),
                  Text(
                    l10n.createOnDate,
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  Text(updatedDateFormatted)
                ],
              ),
              Theme(
                data: ThemeData(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  expandedAlignment: Alignment.topLeft,
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  tilePadding: EdgeInsets.zero,
                  title: Text(
                    l10n.editTodoDescriptionLabel,
                    style: const TextStyle(fontSize: 13),
                  ),
                  children: [
                    Text(task.description ?? ''),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
