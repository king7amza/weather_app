enum ThemeType {
  lightMode,
  darkMode,
  primaryMode,
  darkCyanMode,
  pinkMode,
  brownMode;

  static ThemeType fromString(String? themeName) {
    return ThemeType.values.firstWhere(
      (e) => e.name == themeName,
      orElse: () => ThemeType.primaryMode,
    );
  }
}
