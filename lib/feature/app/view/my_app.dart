import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:task_board/app/ui_status.dart';
import 'package:task_board/feature/app/bloc/my_app_bloc.dart';
import 'package:task_board/injector/injector.dart';
import 'package:task_board/router/app_router.dart';
import 'package:task_board/theme/theme.dart';
import 'package:task_board/widgets/splash_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _AppState();
}

class _AppState extends State<MyApp> {
  late final MyAppBloc _myAppBloc;

  @override
  void initState() {
    _myAppBloc = Injector.instance<MyAppBloc>()
      ..add(
        const MyAppEvent.loaded(),
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MyAppBloc>.value(
      value: _myAppBloc,
      child: BlocSelector<MyAppBloc, MyAppState, UIStatus>(
        bloc: _myAppBloc,
        selector: (state) => state.status,
        builder: (context, appStatus) {
          return appStatus.when(
            initial: () => const SplashPage(),
            loading: () => const SplashPage(),
            loadFailed: (_) => const SizedBox(),
            loadSuccess: (_) => const _MyApp(),
          );
        },
      ),
    );
  }
}

class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: const [
        ...AppLocalizations.localizationsDelegates,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
      ],
      locale: const Locale("en"),
      theme: FlutterTasksTheme.light,
      darkTheme: FlutterTasksTheme.dark,
      routerConfig: AppRouter.router,
      title: 'Kanban Board',
    );
  }
}
