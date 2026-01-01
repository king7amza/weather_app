part of 'set_new_theme_cubit.dart';

sealed class SetNewThemeState {}

final class SetNewThemeInitial extends SetNewThemeState {}

final class SetNewThemeChanged extends SetNewThemeState {
  final String selectedTheme;
  SetNewThemeChanged({required this.selectedTheme});
}

final class GetCurrentTheme extends SetNewThemeState {
  final String currentTheme;
  GetCurrentTheme({required this.currentTheme});
}
