import 'package:go_router/go_router.dart';
import 'package:task_board/feature/editTask/view/edit_task_page.dart';
import 'package:task_board/feature/home/view/home_page.dart';
import 'package:task_board/feature/task/view/task_page.dart';

class AppRouter {
  AppRouter._();

  static const String appDirector = 'appDirector';
  static const String appDirectorPath = '/';

  static const String homeNamed = 'home';
  static const String homePath = '/';

  static const String taskName = 'tasks';
  static const String taskPath = '/tasks';

  static const String editTaskName = 'editTask';
  static const String editTaskPath = '/tasks/editTask';

  static GoRouter get router => _router;
  static final _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        name: homeNamed,
        path: homePath,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        name: taskName,
        path: taskPath,
        builder: (context, state) => const TaskPage(isCompleted: 1,),
      ),
      GoRoute(
        name: editTaskName,
        path: editTaskPath,
        builder: (context, state) => const EditTaskPage(),
      ),
    ]
  );
}
