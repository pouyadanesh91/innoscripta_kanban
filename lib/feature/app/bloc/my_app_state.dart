part of 'my_app_bloc.dart';

@freezed
class MyAppState with _$MyAppState {
  const factory MyAppState({
    @Default(UIInitial()) UIStatus status,
    @Default(AppConfig.defaultLocale) String locale,
    @Default(false) bool isDarkMode,
    @Default(true) bool isFirstUse,
  }) = _MyAppState;
}
