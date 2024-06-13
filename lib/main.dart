import 'package:task_board/bootstrap.dart';
import 'package:task_board/configs/app_config.dart';

Future<void> main() async {
  await bootstrap(
    flavorConfiguration: () async {
      AppConfig.configDev();
    },
  );
}