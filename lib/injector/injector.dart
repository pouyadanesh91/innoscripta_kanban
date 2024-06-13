import 'package:get_it/get_it.dart';
import 'package:task_board/injector/modules/bloc_module.dart';
import 'package:task_board/injector/modules/dio_module.dart';
import 'package:task_board/injector/modules/repository_module.dart';
import 'package:task_board/injector/modules/rest_client_module.dart';

class Injector {
  Injector._();
  static GetIt instance = GetIt.instance;

  static void init() {
    DioModule.setup();
    RestClientModule.init();
    RepositoryModule.init();
    BlocModule.init();
  }

  static void reset() {
    instance.reset();
  }

  static void resetLazySingleton() {
    instance.resetLazySingleton();
  }
}