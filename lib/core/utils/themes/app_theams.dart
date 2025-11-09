import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/themes/app_colors.dart';

class AppTheams {
  static ThemeData get mainTheme => ThemeData(
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.primaryColor,
      selectionColor: AppColors.primaryColor,
      selectionHandleColor: AppColors.primaryColor,
    ),
  );
}

ColorScheme colorScheme = ColorScheme.fromSeed(
  seedColor: AppColors.primaryColor,
);
