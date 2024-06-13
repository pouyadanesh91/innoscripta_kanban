import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:task_board/app/app_bloc_observer.dart';
import 'package:task_board/feature/app/view/my_app.dart';
import 'package:task_board/injector/injector.dart';

Future<void> bootstrap({
  AsyncCallback? flavorConfiguration,
}) async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    Logger.level = Level.trace;
    await flavorConfiguration?.call();

    Injector.init();

    await Injector.instance.allReady();

    Bloc.observer = const AppBlocObserver();

    runApp(const MyApp());
  }, (error, stack) {
    log(error.toString(), stackTrace: stack);
  });
}
