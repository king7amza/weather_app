import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/local_database_services.dart';
import 'package:weather_app/core/theme_enum_model.dart';
import 'package:weather_app/core/utils/themes/app_theams.dart';

part 'set_new_theme_state.dart';

class SetNewThemeCubit extends Cubit<SetNewThemeState> {
  SetNewThemeCubit() : super(SetNewThemeInitial());
  final LocalDatabaseServices _localDatabaseServices = LocalDatabaseServices();
  void changeTheme(String selectedTheme) {
      _localDatabaseServices.setCurrentTheme(selectedTheme);
      getCurrentTheme();
  }

  void getCurrentTheme() async{
      final savedThemeString = await _localDatabaseServices.getCurrentTheme();
      final ThemeType themeEnum = ThemeType.fromString(savedThemeString);
      final ThemeData currentTheme;
      switch (themeEnum) {
        case ThemeType.lightMode:
          currentTheme = AppThemes.lightMode;
          break;
        case ThemeType.darkMode:
          currentTheme = AppThemes.darkMode;
          break;
        case ThemeType.primaryMode:
          currentTheme = AppThemes.primaryMode;
          break;
        case ThemeType.darkCyanMode:
          currentTheme = AppThemes.darkCyanMode;
          break;
        case ThemeType.pinkMode:
          currentTheme = AppThemes.pinkMode;
          break;
        case ThemeType.brownMode:
          currentTheme = AppThemes.brownMode;
          break;
      }
      emit(GetCurrentTheme(currentTheme: currentTheme));
    }
  }
