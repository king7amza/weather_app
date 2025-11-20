import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/themes/app_colors.dart';

class AppThemes {
  static ThemeData primaryMode = ThemeData(
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor,
      onPrimary: AppColors.white,
      secondary: AppColors.secondaryColor,
      onSurface: AppColors.grey,
      error: AppColors.errorColor,
      tertiary: AppColors.gold,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.primaryColor,
      selectionColor: AppColors.secondaryColor,
      selectionHandleColor: AppColors.primaryColor,
    ),
  );
  static ThemeData lightMode = ThemeData(
    colorScheme: ColorScheme.light(
      primary: AppColors.white,
      onPrimary: AppColors.black,
      secondary: AppColors.secondaryColor,
      onSurface: AppColors.grey,
      error: AppColors.errorColor,
      tertiary: AppColors.gold,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.white,
      selectionColor: AppColors.secondaryColor,
      selectionHandleColor: AppColors.white,
    ),
  );
  static ThemeData darkMode = ThemeData(
    colorScheme: ColorScheme.dark(
      primary: AppColors.black,
      secondary: AppColors.secondaryColor,
      onPrimary: AppColors.white,
      onSurface: AppColors.grey,
      error: AppColors.errorColor,
      tertiary: AppColors.gold,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.black,
      selectionColor: AppColors.secondaryColor,
      selectionHandleColor: AppColors.black,
    ),
  );
  static ThemeData darkCyanMode = ThemeData(
    colorScheme: ColorScheme.dark(
      primary: AppColors.black,
      secondary: AppColors.cyan,
      onPrimary: AppColors.white,
      onSurface: AppColors.grey,
      error: AppColors.errorColor,
      tertiary: AppColors.gold,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.black,
      selectionColor: AppColors.cyan,
      selectionHandleColor: AppColors.black,
    ),
  );
  static ThemeData pinkMode = ThemeData(
    colorScheme: ColorScheme.dark(
      primary: AppColors.pink,
      secondary: AppColors.lightRed,
      onPrimary: AppColors.white,
      onSurface: AppColors.grey,
      error: AppColors.errorColor,
      tertiary: AppColors.gold,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.black,
      selectionColor: AppColors.lightRed,
      selectionHandleColor: AppColors.black,
    ),
  );
  static ThemeData brownMode = ThemeData(
    colorScheme: ColorScheme.dark(
      primary: AppColors.brown,
      secondary: AppColors.orange,
      onPrimary: AppColors.white,
      onSurface: AppColors.grey,
      error: AppColors.errorColor,
      tertiary: AppColors.gold,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.black,
      selectionColor: AppColors.orange,
      selectionHandleColor: AppColors.black,
    ),
  );
}
