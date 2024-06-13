import 'package:task_board/feature/editTask/bloc/edit_task_bloc.dart';
import 'package:task_board/feature/task/bloc/task_bloc.dart';
import 'package:task_board/feature/app/bloc/my_app_bloc.dart';
import 'package:task_board/injector/injector.dart';

class BlocModule {
  BlocModule._();

  static void init() {
    final injector = Injector.instance;

    injector
      ..registerLazySingleton<MyAppBloc>(
        () => MyAppBloc(),
      )
      ..registerFactory<TaskBloc>(
        () => TaskBloc(
          taskRepository: injector(),
        ),
      )
      ..registerFactory<EditTaskBloc>(
        () => EditTaskBloc(
          taskRepository: injector(),
        ),
      );
  }
}