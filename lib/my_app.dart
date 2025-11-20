import 'package:flutter/material.dart';
import 'package:weather_app/core/app_constants.dart';
import 'package:weather_app/core/utils/themes/app_theams.dart';
import 'package:weather_app/features/common/common_screens/indexed_stack_nav_bar.dart';
import 'package:weather_app/features/common/common_services/local_database_services.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData currentTheme = AppThemes.primaryMode;
  final LocalDatabaseServices _localDatabaseServices = LocalDatabaseServices();
  @override
  void initState() {
    super.initState();
    updateTheme();
  }

  void setSelectedTheme(String selectedTheme) async {
    _localDatabaseServices.setCurrentTheme(selectedTheme);
    updateTheme();
  }

  Future<void> getSelectedTheme() async {
    final savedTheme = await _localDatabaseServices.getCurrentTheme();
    switch (savedTheme) {
      case "lightMode":
        currentTheme = AppThemes.lightMode;
        break;
      case "darkMode":
        currentTheme = AppThemes.darkMode;
        break;
      case "primaryMode":
        currentTheme = AppThemes.primaryMode;
        break;
      case "darkCyanMode":
        currentTheme = AppThemes.darkCyanMode;
        break;
      case "pinkMode":
        currentTheme = AppThemes.pinkMode;
        break;
      case "brownMode":
        currentTheme = AppThemes.brownMode;
        break;
      default:
        currentTheme = AppThemes.primaryMode;
    }
  }

  void updateTheme() async {
    await getSelectedTheme();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      theme: currentTheme,
      home: IndexedStackNavBar(changeTheme: setSelectedTheme),
    );
  }
}
