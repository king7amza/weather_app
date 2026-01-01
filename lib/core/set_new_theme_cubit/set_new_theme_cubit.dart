import 'package:flutter_bloc/flutter_bloc.dart';

part 'set_new_theme_state.dart';

class SetNewThemeCubit extends Cubit<SetNewThemeState> {
  SetNewThemeCubit() : super(SetNewThemeInitial());

  void changeTheme(String selectedTheme) {
    emit(SetNewThemeChanged(selectedTheme: selectedTheme));
  }

  void getCurrentTheme(String currentTheme) {
    emit(GetCurrentTheme(currentTheme: currentTheme));
  }
}
