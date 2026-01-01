import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/app_constants.dart';

class LocalDatabaseServices {
  void setCurrentTheme(String theme) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstants.currentTheme, theme);
  }

  Future<String?> getCurrentTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(AppConstants.currentTheme);
  }
}
