
import 'package:task_board/data/data_providers/task_api.dart';
import 'package:task_board/injector/injector.dart';
import 'package:task_board/injector/modules/dio_module.dart';

class RestClientModule {
  RestClientModule._();

  static void init() {
    final injector = Injector.instance;

    injector.registerFactory<TaskApi>(
      () => TaskApi(
        injector(instanceName: DioModule.dioInstanceName),
      ),
    );
  }
}