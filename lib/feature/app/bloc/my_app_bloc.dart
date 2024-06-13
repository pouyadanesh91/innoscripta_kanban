import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_board/app/ui_status.dart';
import 'package:task_board/configs/app_config.dart';

part 'my_app_event.dart';
part 'my_app_state.dart';
part 'my_app_bloc.freezed.dart';

class MyAppBloc extends Bloc<MyAppEvent, MyAppState> {
  MyAppBloc() : super(const MyAppState()) {
    on<_Loaded>(_onLoaded);
    on<MyAppEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  FutureOr<void> _onLoaded(
    _Loaded event,
    Emitter<MyAppState> emit,
  ) {
    try {
      emit(
        state.copyWith(
          status: const UILoading(),
        ),
      );


      emit(
        state.copyWith(
          status: const UILoadSuccess(),
        ),
      );
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      emit(
        state.copyWith(
          status: UILoadFailed(message: e.toString()),
        ),
      );
    }
  }
}
