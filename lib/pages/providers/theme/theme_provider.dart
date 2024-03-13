import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

enum AppTheme {
  light,
  dark,
}

/// Provider to set the theme of the app
@riverpod
class Theme extends _$Theme {
  // the return type of the method below is AppTheme i.e. this provider manages
  // the state of type AppTheme
  @override
  AppTheme build() {
    // returning AppTheme.light as the initial state of the Theme provider
    return AppTheme.light;
  }

  /// method to toggle the app theme
  void togglTheme() {
    state = state == AppTheme.light ? AppTheme.dark : AppTheme.light;
  }
}
