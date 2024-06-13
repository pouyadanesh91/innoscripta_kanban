import 'package:task_board/data/repositories/task_repository.dart';
import 'package:task_board/data/repositories/task_repository_impl.dart';
import 'package:task_board/injector/injector.dart';

class RepositoryModule {
  RepositoryModule._();

  static void init() {
    final injector = Injector.instance;

    injector.registerFactory<TaskRepository>(
      () => TaskRepositoryImpl(
        taskApi: injector(),
      ),
    );
  }
}