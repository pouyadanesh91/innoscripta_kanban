part of 'home_cubit.dart';

enum HomeTab { todoTasks, activeTasks, completed }

@freezed
class HomeState with _$HomeState {

  const HomeState._();

  const factory HomeState({
    @Default(HomeTab.activeTasks) HomeTab tab,
  }) = _HomeState;

  HomeTab get currentTab {
    return tab;
  }
}
